# Database

**To configure:**

Copy '.env.prod.example' to '.env.prod' and modify POSTGRES_PASSWORD.

**To run:**

```bash
docker-compose up -d
```

**To access the database:**

```bash
psql -h IP_ADDRESS -p 5433 -U postgres
```

**To backup the database:**

```bash
pg_dump -h IP_ADDRESS -p 5433 -U postgres -d postgres > backup.sql
```

**To restore the database:**

```bash
psql -h IP_ADDRESS -p 5433 -U postgres -d postgres < backup.sql
```

or

```bash
pg_restore -h IP_ADDRESS -p 5433 -U postgres -d postgres backup.sql
```
