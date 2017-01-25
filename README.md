`squarescale/bundle`
====================

A docker image to run `bundle` with gems in `vendor/bundle`

Run
---

User is mapped from the current user running the docker command. It
allow the docker to create files for the user and avoid permissions
problems (files created by root).

To map the user add the following variable to your docker command:

    -e LOCAL_USER_ID=`id -u $USER`

The current folder should be mapped to `/usr/src/web`.

By example

    docker run --rm -it -v $PWD:/usr/src/web -e LOCAL_USER_ID=`id -u $USER` squarescale/bundle install

Helper
------

You can add the following helper to a sourced file:

```
bndle() (
  docker run -it --rm \
    -v "$(pwd):/usr/src/web" \
    -e LOCAL_USER_ID=`id -u $USER` \
    --log-driver none \
    --name bndle \
    squarescale/bundle "$@"
)
```

And you can simply run `bndle install` or `bndle exec rails console`

Contributing
------------

1. [Fork it](https://github.com/squarescale/bundle/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new _Pull Request_

LICENSE
-------

Please see [LICENSE](https://github.com/squarescale/bundle/blob/master/LICENSE).

