extern crate rusqlite;

use rusqlite::Connection;

pub struct Database {
    	pub connection: Connection,
}

impl Database {
	 pub fn create_table(&self) {
   
 	      // Not going to handle errors for this.
 	      self.connection.execute("CREATE TABLE IF NOT EXISTS todo (todo_id INTEGER PRIMARY KEY, todo_title TEXT NOT NULL)", &[]).unwrap();
  	 }
	
}