# Dubhacks 2016 Group

## Usage

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

Ready to make a merge request on github:

```sh
git checkout master # switch to master
git pull # get all updates to master
git checkout -b cool-feature-mr # make a new branch
git merge --squash cool-feature # merge our working branch into this new branch that has master's updates
git commit -m "new merge request commit"
git push -u origin cool-feature-mr # add this new branch to github
```

Finally, make the merge request on github!

This is a good way to do code review since we can look at the changes
we've made while reviewing the merge request.
