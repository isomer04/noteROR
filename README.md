## NoteROR

**NoteROR** - A Rails application with soft delete functionality.

## Description

NoteROR is a web application developed using the Ruby on Rails framework. It allows users to create, view, edit, and delete notes. The application also includes soft delete functionality to handle the temporary removal of notes, allowing users to recover or permanently delete them.


![noteror](https://github.com/isomer04/noteROR/assets/43922158/afe2b202-20d7-4b0f-8e5c-d57fadcc65ab)

## Features

- Create, view, edit, and delete notes.
- Soft delete functionality for safer note removal.

## Prerequisites

Make sure you have the following installed on your machine:

- Ruby (version 3.2.2)
- Ruby on Rails (version 7.1.2)

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
      bundle exec rspec
      bundle exec rspec spec/views/wiki_posts/item_spec.rb
   ```
![Screenshot_623](https://github.com/isomer04/noteROR/assets/43922158/cf0cb107-e284-40ff-aa2b-06863221f0f5)



## License
This project is licensed under the MIT License.





