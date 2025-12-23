# Error Handling

> Errors are not failures — they're information. Handle them like the valuable data they are.

## Principles

1. **Never swallow errors** — An empty catch block is a hidden bug
2. **Fail fast, fail loudly** — Let errors surface, don't hide them
3. **Provide context** — Error messages should help debugging
4. **Recover gracefully** — Users shouldn't see stack traces

---

## The Golden Rules

### 1. Never Leave a Catch Empty

```
❌ Bad — Error disappears into the void
try {
  await submitForm();
} catch (error) {
  // TODO: handle later
}

✅ Good — At minimum, log it
try {
  await submitForm();
} catch (error) {
  console.error('Form submission failed:', error);
  // Then decide: retry? show message? fallback?
}
```

### 2. Add Context to Errors

```
❌ Bad — Where did this come from?
throw new Error('Failed');

✅ Good — Now we know what and where
throw new Error(`Failed to fetch user profile for ID: ${userId}`);
```

### 3. Handle at the Right Level

```
❌ Bad — Catching too early, losing information
function getUser(id) {
  try {
    return database.query(id);
  } catch {
    return null;  // Caller has no idea it failed
  }
}

✅ Good — Let errors bubble up to where they can be handled meaningfully
function getUser(id) {
  return database.query(id);  // Let caller decide how to handle
}

// In the UI layer where we can show feedback
try {
  const user = await getUser(id);
} catch (error) {
  showToast('Could not load user profile');
  logError(error);
}
```

---

## Error Handling Patterns

### API/Network Errors

```
✅ Pattern: Check response, provide feedback
async function fetchData(url) {
  const response = await fetch(url);

  if (!response.ok) {
    throw new Error(`HTTP ${response.status}: ${response.statusText}`);
  }

  return response.json();
}

// Usage
try {
  const data = await fetchData('/api/users');
} catch (error) {
  if (error.message.includes('401')) {
    redirectToLogin();
  } else if (error.message.includes('404')) {
    showNotFoundMessage();
  } else {
    showGenericError();
  }
}
```

### Form Validation Errors

```
✅ Pattern: Collect all errors, show together
function validateForm(data) {
  const errors = {};

  if (!data.email) {
    errors.email = 'Email is required';
  } else if (!isValidEmail(data.email)) {
    errors.email = 'Please enter a valid email';
  }

  if (!data.password) {
    errors.password = 'Password is required';
  }

  return {
    isValid: Object.keys(errors).length === 0,
    errors
  };
}
```

### Async Operations

```
✅ Pattern: Always handle both success and failure
async function loadUserProfile() {
  setLoading(true);
  setError(null);

  try {
    const profile = await fetchUserProfile();
    setProfile(profile);
  } catch (error) {
    setError('Unable to load profile. Please try again.');
    logError('Profile load failed', error);
  } finally {
    setLoading(false);
  }
}
```

---

## User-Facing Error Messages

### Do
- Be helpful: "Please check your internet connection"
- Be specific: "The email address is already registered"
- Offer next steps: "Try again" or "Contact support"

### Don't
- Show technical details: `TypeError: Cannot read property 'map' of undefined`
- Be vague: "An error occurred"
- Blame the user: "You entered invalid data"

---

## Error Types

| Type | When to Use | Example |
|------|-------------|---------|
| Validation Error | Bad user input | "Email format is invalid" |
| Network Error | Connection issues | "Unable to reach server" |
| Auth Error | Permission denied | "Please log in to continue" |
| Not Found | Resource missing | "User not found" |
| Server Error | Backend failure | "Something went wrong on our end" |

---

## Questions to Ask

1. "What if this fails? What happens next?"
2. "Will the user understand this error message?"
3. "Am I losing important error information?"
4. "Should I retry automatically or tell the user?"
