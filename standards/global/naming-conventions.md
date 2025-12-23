# Naming Conventions

> Names should tell stories. When someone reads your code 6 months from now, they should understand it without comments.

## Principles

1. **Descriptive over short** — `userEmailAddress` beats `uea`
2. **Pronounceable** — If you can't say it out loud, rename it
3. **Searchable** — Unique names are easier to find
4. **Consistent** — Same concept = same name everywhere

---

## Variables

| Pattern | Example | When to Use |
|---------|---------|-------------|
| camelCase | `userName` | Default for most variables |
| UPPER_SNAKE_CASE | `MAX_RETRIES` | Constants |
| PascalCase | `UserProfile` | Classes, Types, Components |

### Bad vs Good

```
❌ d = new Date()
✅ createdAt = new Date()

❌ temp = getUser()
✅ currentUser = getUser()

❌ data = fetch(...)
✅ userProfiles = fetch(...)

❌ flag = true
✅ isAuthenticated = true
```

---

## Booleans

**Always prefix with:** is, has, can, should, was

```
❌ loading
✅ isLoading

❌ admin
✅ isAdmin

❌ visible
✅ isVisible

❌ permission
✅ hasPermission
```

---

## Functions

**Start with a verb.** Functions DO things.

```
❌ user()
✅ getUser()

❌ validation()
✅ validateEmail()

❌ submit()
✅ submitContactForm()
```

### Common Prefixes

| Prefix | Purpose | Example |
|--------|---------|---------|
| get | Retrieve data | `getUserById()` |
| set | Assign value | `setUserName()` |
| fetch | Async data retrieval | `fetchUserProfile()` |
| handle | Event handler | `handleFormSubmit()` |
| on | Event callback | `onUserClick()` |
| is/has | Boolean check | `isValidEmail()` |
| create | Constructor | `createUser()` |
| update | Modify existing | `updateUserProfile()` |
| delete | Remove | `deleteUser()` |

---

## Files and Folders

| Type | Pattern | Example |
|------|---------|---------|
| Components | PascalCase | `UserProfile.tsx` |
| Hooks | camelCase, use prefix | `useAuth.ts` |
| Utils | camelCase | `formatDate.ts` |
| Constants | camelCase or SCREAMING | `constants.ts` |
| Types | PascalCase | `User.types.ts` |
| Tests | Match source | `UserProfile.test.tsx` |

---

## Questions to Ask

When naming, ask yourself:
1. "Would a new developer understand this?"
2. "Is this name too generic?" (data, info, temp)
3. "Does this name match what it actually contains?"
4. "Can I search for this name uniquely?"

---

## Anti-Patterns

### Abbreviations
```
❌ usr, msg, btn, nav
✅ user, message, button, navigation
```

### Generic Names
```
❌ data, info, temp, stuff, things
✅ userProfile, errorMessage, pendingRequest
```

### Numbered Variables
```
❌ user1, user2, result1
✅ primaryUser, secondaryUser, formattedResult
```

### Type in Name
```
❌ userArray, nameString
✅ users, name
```
