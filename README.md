# Task for Mobilize

1. After running the application create new members with this request:

```
curl localhost:3000/addMembers  \
-H 'Content-Type: application/json' \
-d '{ "emails": [ { "email": "test1@example.com", "name": "test1" }, { "email": "test2@example.com", "name": "test2" } ] }' 
```

2. Invite members by email using this request:

```
curl localhost:3000/inviteMembers  \
-H 'Content-Type: application/json'  \
-d '{ "emails": ["test1@example.com", "test2@example.com"] }' 
```