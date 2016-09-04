mod todo;
mod database;

extern crate router;
extern crate iron;
extern crate rusqlite;
extern crate rustc_serialize;

use rustc_serialize::json;
use rusqlite::Connection;
use iron::*;
use router::*;
use std::sync::{Arc, Mutex};
use std::io::Read;

fn main() {
		
	// Hopefully we can write to this file
    	let database = database::Database { connection:  Connection::open("./db.sqlite").unwrap() };
	
    	database.create_table();
	
	// If the database is empty then we should just add some test ones for fun
	if todo::get_all_todos(&database).len() == 0 {
		
		todo::Todo { todo_id: 1, todo_title: "Pick up groceries".to_string() }.insert_into_database(&database);
		todo::Todo { todo_id: 2, todo_title: "Take out the dog".to_string() }.insert_into_database(&database);
	};
	
	println!("{:?}", todo::get_all_todos(&database));
	
	let mut request_router = Router::new();
	
	// Arc is a reference counting type and mutex is just a type that implements Sync with a mutext lock - this allows us to share this reference across scopes/threads
	let shared_database_ref = Arc::new(Mutex::new(database));
	let other_data_base_ref = shared_database_ref.clone();
	
	let get_request_handler = move |_: &mut Request| {
		let db = shared_database_ref.lock().unwrap();
		return Ok(Response::with((status::Ok, json::encode(&todo::get_all_todos(&db)).unwrap())));
	};
	
	let add_todo_handler = move |request: &mut Request| {
		let mut string_buffer = String::new();
		
		request.body.read_to_string(&mut string_buffer);
	
		let todo: Result<todo::Todo, rustc_serialize::json::DecoderError> = json::decode(&string_buffer);
		
		if let Some(todo) = todo.ok() {
			let db = other_data_base_ref.lock().unwrap();
			todo.insert_into_database(&db);
			return Ok(Response::with((status::Ok)));
		} else {
			return Ok(Response::with((status::BadRequest)));
		};
		
	};
	
	request_router.get("/todos", get_request_handler, "todos");
	request_router.post("/add_todos", add_todo_handler, "todos");
	
    	Iron::new(request_router).http("localhost:3030").unwrap();
}
