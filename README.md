# GraphBanking

To start the server:

  * Install dependencies with `mix deps.get`
  * Have a postgres running with username/password postgres/postgres
  * Create and migrate database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

#### Usage examples: 

##### Get account
```
account(id: 2) {
  id
  currentBalance
  transactions {
    id
    address
    amount
    when
  }
}
```

##### Open account
```
openAccount(balance: 100) {
  id
  currentBalance
}
```

##### Transfer Money
```
transferMoney(sender: 1, address: 2, amount: 42) {
  id
  address
  amount
  when
}
```

challenge link:
https://github.com/skilopay/careers/tree/master/challenges/backend
