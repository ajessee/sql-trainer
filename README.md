
# [Sql Tutor](https://sql-tutor-upgrade.herokuapp.com/)

An app designed to allow students to practice and level up their SQL queries. 

### Update 2020

I've forked and updated [audibleblink](https://github.com/audibleblink)'s original app that he built 5 years ago when he was my teacher at DevBootCamp. All credit to him for the awesome code. <br />
I've upgraded it to Rails 5.2 (Rails 6 was a bridge too far at this point), and deployed it to Heroku for all to use.

![Imgur](http://i.imgur.com/xLP2omw.png)

### Setup

Install gems:
```
$ bundle install
```

Default environment variables are stored in the `dotenv` file. You should create both `.env.development` and `.env.test` files with your local configuration details.

```
$ cp dotenv .env.development
$ cp dotenv .env.test
```

Create and seed the database:
```
$ rake db:setup
```

Setup pow using powder
```
$ powder install
$ powder link
```

Your app should start and be accessible at `http://launchpad.devbootcamp.dev`. You can restart the server with the command `$ powder restart`.

### Development

See a list of powder commands:
```
$ powder -h
```

Run tests:
```
$ RAILS_ENV=test rake spec
```
