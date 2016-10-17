# Re-eddit - Dubhacks 2016

## Description

A Nodejs API that filters NSFW and inflammatory subreddit
posts from a given subreddit.

Comes with a front-end in angularjs.

Allows for a more friendly, less bully prone reddit browsing
experience.

Uses Clarifai's NSFW trained image processing model to determine
if subreddit posts' thumbnails and linked images are NSFW.

Uses Google's natural language processing API to determine if the subreddit posts' contain negative sentiment.


## Dependencies

* Clarifai Image Recognition API
* Google Natural Language Processing API
* Snoowrap - Nodejs wrapper for the Reddit API
* Angularjs - UI framework
* Express - Nodejs http server

## Infrastructure

* Amazon Web Services - hosts this app!

## Usage

TODO

## Contributing

#### Using Git

Should never push directly to the master branch, this can
incur unexpected commits and cause merge conflicts.

Start development on a new branch and add that branch to github:

```sh
git checkout master # make sure you're on the master branch
git checkout -b cool-feature # create a new branch to work on
git push -u origin cool-feature # add that branch to the remote github repo
```

Make changes and commits:

```sh
git add .
git commit -m "commit message"
```

Ready to make a pull request on github:

```sh
git checkout master # switch to master
git pull # get all updates to master
git checkout -b cool-feature-pr # make a new branch
git merge --squash cool-feature # merge our working branch into this new branch that has master's updates
git commit -m "new pull request commit"
git push -u origin cool-feature-pr # add this new branch to github
```

Finally, make the pull request on github!

This is a good way to do code review since we can look at the changes
we've made while reviewing the pull request.
