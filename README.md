# ciscc-docker-next

## Cloning

```bash
git clone https://github.com/pan93412/ciscc-docker-next.git --recursive
```

## Configuration

All the configuration should set in `.*.env` file.

1. Copy `.*.env.example` to `.*.env` and modify it.

2. Install the dependencies of `app` and build it.
   ```bash
   $ docker run --entrypoint "bash" --interactive --tty -v $(pwd)/app:/app node:14
   # cd /app
   # export NODE_ENV=production
   # yarn && yarn build
   # exit
   ```

## Running

1. Start server.

    ```bash
    docker-compose up -d
    ```

2. Register a new administration user in Strapi.

3. Create a new user role called "Backend"

    a. Go to Strapi admin page. Click `General` (`Settings`) > `USERS & PERMISSIONS PLUGINS` (`Roles`) > [`+ Add new role`].

    ![General (Settings) > USERS & PERMISSIONS PLUGINS (Roles) > [+ Add new role]](assets/images/strapi-user-create-role.png)

    b. Then, set the name to "Backend"; the description is all depend on you.

    ![Name = "Backend"; Description = "For backend."](/assets/images/strapi-create-role-details.png)

    c. Select all permissions under "Application"

    ![Checked Application > BLACKLIST > "Select all"; Application > MESSAGES > "Select all"](/assets/images/strapi-create-role-perm.png)

    d. All done! Save it.

4. Modify the role "Public". Enable `count`, `find`, `findOne` for both the schema. Save it.

5. Go to `COLLECTION TYPES` > `Users`, create your backend user.

    a. The username should be as same as the `STRAPI_ACCOUNT` in `.env` file you defined.

    b. The password should be as same as the `STRAPI_PASSWORD` in `.env` file you defined.

    c. The email address can be any valid value. It does not confirm it.

    ![Go to `COLLECTION TYPES` > `Users`](/assets/images/strapi-create-user.png)

6. Set up a web server to reverse proxy to these two services.

    | Service      | Default Port      |
    | ------------ | ----------------- |
    | backend      | 20100             |
    | strapi       | 20101             |

7. Set up and deploy the [frontend](https://github.com/pan93412/ciscc-frontend-next) to Vercel. All done!

## Assocated Projects

- [ciscc-strapi](https://github.com/pan93412/ciscc-strapi)
- [ciscc-frontend-next](https://github.com/pan93412/ciscc-backend-next)
- [ciscc-backend-next](https://github.com/pan93412/ciscc-backend-next)

## Authors

(C) pan93412, 2021.
