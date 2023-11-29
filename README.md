# Rails Application README

## Project Name

**NoteROR** - A Rails application with soft delete functionality.

## Description

NoteROR is a web application developed using the Ruby on Rails framework. It allows users to create, view, edit, and delete notes. The application also includes soft delete functionality to handle the temporary removal of notes, allowing users to recover or permanently delete them.

## Features

- Create, view, edit, and delete notes.
- Soft delete functionality for safer note removal.

## Prerequisites

Make sure you have the following installed on your machine:

- Ruby (version X.X.X)
- Ruby on Rails (version X.X.X)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/isomer04/noteROR.git
   ```
2. Navigate to the project directory:

  ```bash
    cd noteROR
   ```
3. Install dependencies:

```bash
    bundle install
   ```
4. Set up the database:
   ```bash
    rails db:create db:migrate
   ```

   ## Usage

   1. Start the Rails server:


   ```bash
    rails server
   ```

    2. Open your web browser and visit http://localhost:3000.
    3. Explore the NoteROR application.
  
     ## Soft Delete Functionality

      NoteROR implements soft delete functionality to handle the deletion of notes. When a user deletes a note, it is not immediately removed from the database. Instead, the note is marked as "soft       deleted" by setting the deleted_at timestamp. Soft-deleted notes are excluded from regular queries but can be recovered or permanently deleted.

        ## Running Tests
     To run the test suite:

      ```bash
      bundle exec rspec spec/views/wiki_posts/item_spec.rb
   ```

      ## Contributing
  If you'd like to contribute to this project, please follow our contribution guidelines.

## License
This project is licensed under the MIT License.





