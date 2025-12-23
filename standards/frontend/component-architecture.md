# Component Architecture

> A component should do ONE thing well. If you're describing it with "and", split it.

## Principles

1. **Single Responsibility** — One component, one job
2. **Composition over complexity** — Build complex from simple
3. **Props down, events up** — Data flows one way
4. **Minimal surface area** — Only expose what's necessary

---

## Component Size Guidelines

### Signs a Component is Too Big

- File exceeds 200 lines
- More than 5-7 props
- Multiple unrelated pieces of state
- Hard to name (if you can't name it, it's doing too much)
- You describe it with "and" — "It shows the header AND handles auth AND..."

### The Split Test

Ask: "Can I use part of this component somewhere else?"

If yes → Split it out.

---

## Component Categories

### 1. Presentational (UI) Components

**Purpose:** Display things. No business logic.

```
Characteristics:
- Receive data via props
- Render UI
- Emit events for interactions
- No API calls
- No direct state management
```

Examples: Button, Card, Modal, FormInput, Avatar

### 2. Container (Smart) Components

**Purpose:** Manage data and logic.

```
Characteristics:
- Fetch data
- Manage complex state
- Handle business logic
- Pass data to presentational components
```

Examples: UserProfilePage, DashboardContainer, AuthProvider

### 3. Layout Components

**Purpose:** Structure and positioning.

```
Characteristics:
- Accept children
- Handle spacing, grids, responsive behavior
- No business logic
```

Examples: PageLayout, Grid, Stack, Sidebar

---

## Props Interface Design

### Good Props

```
Minimal — Only what's needed
Typed — Clear TypeScript interfaces
Defaulted — Sensible defaults for optional props
Documented — JSDoc for non-obvious props
```

### Anti-Patterns

```
❌ Boolean soup
<Button primary secondary large small />

✅ Discriminated unions
<Button variant="primary" size="large" />
```

```
❌ Prop drilling (5+ levels)
<App user={user}>
  <Layout user={user}>
    <Main user={user}>
      <Content user={user}>
        <Widget user={user} />

✅ Context for cross-cutting data
const user = useUser();
```

---

## State Placement

### Where Should State Live?

Ask: "Who needs this data?"

| Scope | Where to Put It |
|-------|-----------------|
| One component | useState in that component |
| Parent + children | Lift to parent |
| Sibling components | Lift to common parent |
| Many unrelated components | Context or state library |
| Server data | React Query / SWR / Server Components |

### The Rule of Colocation

State should live as close as possible to where it's used.

```
❌ Global state for local concerns
// In global store
modalState: { isOpen: false }

✅ Local state for local concerns
function Modal() {
  const [isOpen, setIsOpen] = useState(false);
}
```

---

## Composition Patterns

### Children Pattern

```
<Card>
  <CardHeader>Title</CardHeader>
  <CardBody>Content</CardBody>
</Card>
```

### Render Props

```
<DataFetcher url="/api/users">
  {({ data, loading, error }) => (
    loading ? <Spinner /> : <UserList users={data} />
  )}
</DataFetcher>
```

### Compound Components

```
<Select value={value} onChange={setValue}>
  <Select.Option value="a">Option A</Select.Option>
  <Select.Option value="b">Option B</Select.Option>
</Select>
```

---

## Questions to Ask

1. "What is the ONE job of this component?"
2. "Can this be split into smaller pieces?"
3. "Where should this state live?"
4. "Is this logic reusable?"
5. "Would another developer understand this in 6 months?"

---

## Anti-Patterns to Avoid

### God Components
A single component that does everything — fetches data, manages state, renders UI, handles routing...

### Premature Abstraction
Creating a `<GenericFlexibleButton>` when you only have one button.

### Logic in Render
Complex calculations or filtering during render. Use useMemo or compute beforehand.

### Prop Drilling
Passing props through 5+ levels. Use context instead.
