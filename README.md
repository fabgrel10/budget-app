# Budget App

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

> Rails capstone project from the Microverse Full Stack  Development Bootcamp.

![screenshot](./app/assets/images/app_screenshot.png)

## Video Demo

[Google Drive](https://drive.google.com/file/d/1wd2wUDawmmUIhkMZz24bQNtmYyXEOr6q/view?usp=sharing)

## Live Demo

[Heroku](https://budget-app-microverse.herokuapp.com/)

## Description

The Budget App is a full stack application that allows users to:

- Register and log in, so that the data is private to them.
- Introduce new transactions associated with a category.
- See the money spent on each category.

## Built with

- `Ruby 3.1.2`
- `Rails 7.0.3`
- `Postgres 14.3.1`
- `Bulma 0.9.4`

## Getting Started

### Prerequisites

- Ruby
- Postgres server

### Setup

Clone this repo and enter the directory:

```sh
git clone git@github.com:fabgrel10/budget-app.git
cd recipe-app
```

### Install

Install all the dependencies, including [ImageMagic](https://imagemagick.org/script/index.php):

```sh
sudo apt install imagemagick
```
```sh
bundler install
```

### Usage

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb
rails server # start server
```

Head to the [localhost:3000](http://localhost:3000) to see the app.

### Run tests

```sh
./bin/rspec
```
or
```sh
bundle exec rspec spec
```

## Author

👤 **Fabrizio**

| &nbsp;       | &nbsp;                                               |
| ------------ | ---------------------------------------------------- |
| **GitHub**   | [@fabgrel10](https://github.com/fabgrel10)           |
| **Twitter**  | [@fabgrel10](https://twitter.com/fabgrel10)          |
| **LinkedIn** | [@fabgrel10](https://www.linkedin.com/in/fabgrel10/) |

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse.
- Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella).

## 📝 License

This project is [MIT](https://mit-license.org/) licensed. See [LICENSE.md](LICENSE.md) for details.
