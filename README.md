# Facebook Clone

## Table of Contents

- [About](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#about)
- [Preview](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#preview)
- [Built with](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#built-with)
- [Prerequisites](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#prerequisites)
- [Installation](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#installation)
- [Testing](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#testing)
- [Authors](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#authors)
- [Future improvements](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#future-improvements)
- [Acknowledgments](https://github.com/bruna-genz/facebook_clone/blob/master/README.md#acknowledgements)

## About

In this app, we created a Facebook-like application. It has the following functionalities:
- User can create an account or sign up with Facebook;
- Users can make posts;
- Users can like and comment on posts;
- Users can request friendship from others sign up users;
- Users can create chat rooms and talk to other users (see section Future Improvements);
- Functional search bar to find users.

## Preview
[Live version](https://fb-clone-bruna-nico.herokuapp.com/contents/new)

### Home page
![img](app/assets/images/home_page.png)

### Chat
![img](app/assets/images/chat.png)

## Built with

- HTML 5 (erb);
- CSS 3 (scss);
- Ruby 2.6.3;
- Rails 6.0.1;
- JavaScript;
- Bulma.

## Prerequisites

- Ruby
- Rails

## Installation 

To install a local version of this project, follow these steps:

- Clone the repository running the following command: 

```
git clone git@github.com:bruna-genz/facebook_clone.git
```

- Open the project's folder on your text editor and install the required gems by running:

```
bundle install
```
- Migrate the database to your machine:

```
rails db:migrate
```

- Start the server:

```
rails server
```

- With the server running, go to ```http://localhost:3000``` and the app should be working.

## Testing

This project has unit and integration tests. To run the tests, use the following command: ```rspec```.

## Authors

:man: **Nicolás Mariño Parra**

- Github: [@nicolasmarino99](https://github.com/nicolasmarino99)
- Twitter: [@nicolasmarino99](https://twitter.com/nicolasmarino99)
- Linkedin: [Nicolás Mariño Parra](https://www.linkedin.com/in/nicol%C3%A1s-mari%C3%B1o-parra-45a707177/)
- Email: nicolasmarinoparra@gmail.com

:woman: **Bruna Genz**

- Github: [@bruna-genz](https://github.com/bruna-genz)
- Twitter: [@Bruna_GK](https://twitter.com/Bruna_GK)
- Linkedin: [Bruna Genz](https://www.linkedin.com/in/brunagenz/)
- Email: brunagenz92@gmail.com

## Acknowledgements

- To create the friendships logic, we use the following tutorial as reference: https://smartfunnycool.com/friendships-in-activerecord/;
- And for the chat: https://iridakos.com/programming/2019/04/04/creating-chat-application-rails-websockets;

## Future improvements:

- Currently, the user has to refresh the page on the chat to display new messages. The goal is to make the chat asynchronous. 
