class Student
	attr_accessor :name, :bio, :photo

	def self.create_table
		DB.execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, bio TEXT, photo TEXT)")
	end

	def save
		DB.execute("INSERT INTO students (name, bio, photo) VALUES (?,?,?)", name, bio, photo)
	end
end