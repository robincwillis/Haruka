Haruka
======
A simple Japanese to English social dictionary built with Ruby on Rails.

*Using*

Rails 3.2.13
ruby 1.9.3

What Makes Haruka so Awesome?
------
1. User authentication and permissions makes it open for anyone to contribute.
2. A fully searchable database of terms including Kanji, Kana, definitions, literal translations and additional descriptions.
3. Keep track of terms you authored and add other terms to your personal list of favorites.
4. Vote terms up and down to give a sense of accuracy.
5. Flag irrelevant content.
6. Ability to add pictures, comments and phrases to terms.
7. Create associations between related terms.
8. Simple, beautiful responsive design adapts across all browsers, mobile devices and tablets.
9. Environment Variables allow you to easily customize and deploy to your own server.

View Live
------
#[haruka.io](https://www.haruka.io)

Getting Started
------
```
cd config
cp database.yml.example database.yml
cp local_env.example local_env.yml
//Set required environment variables and database settings in database.yml and local_env.yml
rake db:create
rake db:migrate
```
