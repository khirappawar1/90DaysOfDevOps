# Day 38 – YAML Basics

## Task
Before writing a single CI/CD pipeline, you need to get comfortable with **YAML** — the language every pipeline is written in.
You will:
- Understand YAML syntax and rules
- Write YAML files by hand
- Validate them

## Challenge Tasks

### Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (a boolean can be true or false)

**Verify:** Run `cat person.yaml` — does it look clean? No tabs?

### Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using the inline format `[item1, item2]`

Write in your notes: What are the two ways to write a list in YAML?

Ans: In yaml there are two way's to write the yaml file
     1.Block style 
     2.Flow style (List format)
     

### Task 3: Nested Objects
Create `server.yaml` that describes a server:
- `server` with nested keys: `name`, `ip`, `port`
- `database` with nested keys: `host`, `name`, `credentials` (nested further: `user`, `password`)

**Verify:** Try adding a tab instead of spaces — what happens when you validate it?

Ans: In YAML, a nested format means placing data structures (lists or key-value pairs) inside another structure using indentation. It represents hierarchical relationships.YAML uses spaces (indentation) to show nesting.

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
2. The `>` fold style (folds into one line)

Write in your notes: When would you use `|` vs `>`?

Ans: 1.Using | (Literal Block Style – Preserves Newlines)
      - This style keeps line breaks exactly as written.
      2.Using > (Folded Block Style – Folds Lines)
      - This style joins lines into one long line, replacing line breaks with spaces.
      When to Use | vs >
Style|Use Case|Behavior
`	|`|Scripts, logs, certificates, config files
>|Long text paragraphs or messages|Combines lines into one

### Task 5: Validate Your YAML
1. Install `yamllint` or use an online validator
2. Validate both your YAML files
3. Intentionally break the indentation — what error do you get?
4. Fix it and validate again



### Task 6: Spot the Difference
Read both blocks and write what's wrong with the second one:

```yaml
# Block 1 - correct
name: devops
tools:
  - docker
  - kubernetes
```

```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```
Ans: Indentation is wrong in secound Block.

---

## Hints
- YAML uses **spaces only** — never tabs
- Indentation is everything — 2 spaces is standard
- Strings don't need quotes unless they contain special characters (`:`, `#`, etc.)
- `true`/`false` are booleans, `"true"` is a string
- Validate online: yamllint.com
