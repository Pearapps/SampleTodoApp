use database::*;

#[derive(Debug)]
#[derive(RustcEncodable)]
#[derive(RustcDecodable)]
pub struct Todo {
    pub todo_title: String,
    pub todo_id: i32,	
}

impl Todo {
	pub fn insert_into_database(&self, database: &Database) {
		database.connection.execute("INSERT INTO todo (todo_id, todo_title) VALUES ($1, $2)", &[&self.todo_id, &self.todo_title]).unwrap();
	}
}

pub fn get_all_todos(database: &Database) -> Vec<Todo> {
	
	// need to make this mutable so we can borrow it as such in the next expression
	let mut sql_statment = database.connection.prepare("SELECT todo_title, todo_id FROM todo").unwrap();
	
	let models = sql_statment.query_map(&[], |sql_row| {
		let title = sql_row.get(0);
		let id = sql_row.get(1);	
		
		return Todo { todo_id: id, todo_title: title }
	}).unwrap().map(|i| i.unwrap() );
	
	return models.collect();
}
