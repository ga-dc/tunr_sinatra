require 'active_record'
require_relative 'connection'

# models
require_relative '../models/instructor'
require_relative '../models/student'

jesse = Instructor.create(name: "Jesse Shawl", age: 99)
adrian = Instructor.create(name: "Adrian Maseda", age: 100)
nick = Instructor.create(name: "Nick Olds", age: 101)

jesse.students.create(name: "Paul Paulson")
adrian.students.create(name: "Bob Bobson")
nick.students.create(name: "Dwayne The Rock Johnson")
