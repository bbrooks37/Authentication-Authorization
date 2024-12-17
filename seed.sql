-- Drop the database if it already exists
DROP DATABASE IF EXISTS feedback_exercise;

-- Create a new database
CREATE DATABASE feedback_exercise;

-- Connect to the newly created database
\c feedback_exercise

-- Create the users table
CREATE TABLE users (
    username VARCHAR(20) PRIMARY KEY,
    password TEXT NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
);

-- Create the feedback table
CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    username VARCHAR(20) REFERENCES users(username) ON DELETE CASCADE
);

-- Insert sample data into users table
INSERT INTO users (username, password, email, first_name, last_name, is_admin)
VALUES
('john_doe', 'hashed_password1', 'john@example.com', 'John', 'Doe', FALSE),
('jane_smith', 'hashed_password2', 'jane@example.com', 'Jane', 'Smith', FALSE);

-- Insert sample data into feedback table
INSERT INTO feedback (title, content, username)
VALUES
('First Feedback', 'This is the first feedback.', 'john_doe'),
('Second Feedback', 'This is the second feedback.', 'jane_smith');
