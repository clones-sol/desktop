# Flutter Development Rules for Clones Desktop

## Project Architecture

This project follows a clean architecture pattern with clear separation of concerns:

```
lib/
├── application/          # Providers and state management
├── domain/              # Business models and entities
├── infrastructure/      # Repositories and external services
└── ui/
    ├── components/      # Shared UI components
    └── views/          # Screen-specific views
        └── {screen_name}/
            ├── bloc/    # State management for the screen
            └── layouts/ # UI layouts and components
                └── components/ # Screen-specific components
```

## Model Classes

### Freezed Classes
All domain models must use Freezed for immutability and code generation:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Model with _$Model {
  const factory Model({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    String? description,
  }) = _Model;

  factory Model.fromJson(Map<String, dynamic> json) =>
      _$ModelFromJson(json);
}
```

**Examples:**
- `lib/domain/models/demonstration/demonstration.dart`
- `lib/domain/models/forge_task/forge_app.dart`

## State Management

### Riverpod with Annotations
All providers and notifiers must use `riverpod_annotation`:

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ScreenNotifier extends _$ScreenNotifier {
  @override
  ScreenState build() {
    return const ScreenState();
  }
  
  // Methods for state updates
}
```

**Examples:**
- `lib/ui/views/forge_detail/bloc/provider.dart`
- `lib/application/session/provider.dart`

### Bloc Organization
For screen state management, organize in `bloc/` folders:

```
lib/ui/views/{screen_name}/bloc/
├── provider.dart    # Main notifier with @riverpod
├── state.dart       # State class (freezed)
├── setters.dart     # Mixin for state setters
└── provider.g.dart  # Generated provider
```

## UI Organization

### Screen Structure
Each screen should be organized as follows:

```
lib/ui/views/{screen_name}/
├── bloc/                    # State management
│   ├── provider.dart
│   ├── state.dart
│   └── setters.dart
└── layouts/                 # UI layouts
    ├── {screen_name}_view.dart
    └── components/          # Screen-specific components
        ├── component_1.dart
        └── component_2.dart
```

### Component Guidelines

1. **Avoid Long Widgets**: Break down large widgets into smaller components
2. **Screen-Specific Components**: Place in `layouts/components/` folder
3. **Shared Components**: Use `lib/ui/components/` for reusable components

**Examples:**
- `lib/ui/views/forge_detail/layouts/components/forge_factory_header.dart`
- `lib/ui/views/forge_detail/layouts/components/forge_factory_general_tab_factory_name.dart`

## Theming and Styling

### Text Styling
Always use `Theme.of(context).textTheme` for text styling:

```dart
// ✅ Correct
Text(
  'Hello World',
  style: Theme.of(context).textTheme.titleLarge,
)

// ❌ Avoid
Text(
  'Hello World',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### Color Usage
All colors must be defined in `lib/assets.dart` in the `ClonesColors` class:

```dart
// ✅ Correct
Container(
  color: ClonesColors.primary,
  child: Text('Content'),
)

// ❌ Avoid
Container(
  color: Colors.purple,
  child: Text('Content'),
)
```

### Font Usage
Use the predefined font methods from `ClonesFonts`:

```dart
// ✅ Correct
Text(
  'Hello World',
  style: ClonesFonts.getPrimaryFont(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
)

// For monospace text
Text(
  'Code example',
  style: ClonesFonts.getMonoFont(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
)
```

## File Naming Conventions

### Models
- Use snake_case for file names: `user_profile.dart`
- Class names in PascalCase: `UserProfile`

### UI Components
- Use snake_case with descriptive names: `forge_factory_header.dart`
- Widget class names in PascalCase: `ForgeFactoryHeader`

### Providers
- Use snake_case: `user_provider.dart`
- Notifier class names in PascalCase with "Notifier" suffix: `UserNotifier`

## Code Generation

### Required Build Commands
Always run code generation after creating/modifying:
- Freezed models
- Riverpod providers
- JSON serialization

```bash
# Generate all code
dart run build_runner build

# Watch for changes
dart run build_runner watch
```

## Code Quality and Linting

### Analysis Options Compliance
All code must respect the rules defined in `analysis_options.yaml`. Key requirements include:

#### Strict Language Features
- **Strict Casts**: `strict-casts: true`
- **Strict Inference**: `strict-inference: true`
- **Strict Raw Types**: `strict-raw-types: true`

#### Essential Linting Rules
- **Return Types**: Always declare return types (`always_declare_return_types`)
- **Package Imports**: Use package imports instead of relative imports (`always_use_package_imports`)
- **Const Constructors**: Prefer const constructors (`prefer_const_constructors`)
- **Final Fields**: Use final fields when possible (`prefer_final_fields`)
- **Trailing Commas**: Use trailing commas in multi-line collections (`require_trailing_commas`)
- **Single Quotes**: Use single quotes for strings (`prefer_single_quotes`)
- **Null Safety**: Proper null safety practices (`prefer_null_aware_operators`)

#### Code Style
- **File Names**: Use snake_case for file names (`file_names`)
- **Camel Case**: Use camelCase for types and extensions (`camel_case_types`, `camel_case_extensions`)
- **Directives Ordering**: Maintain proper import ordering (`directives_ordering`)
- **End of File**: Ensure files end with newline (`eol_at_end_of_file`)

#### Performance and Best Practices
- **Avoid Print**: Don't use `print()` statements (`avoid_print`)
- **Cancel Subscriptions**: Always cancel subscriptions (`cancel_subscriptions`)
- **Const Declarations**: Use const where possible (`prefer_const_declarations`)
- **Final Locals**: Use final for local variables when possible (`prefer_final_locals`)

#### Flutter-Specific Rules
- **Key in Widgets**: Always provide keys in widget constructors (`use_key_in_widget_constructors`)
- **Colored Box**: Use ColoredBox instead of Container with only color (`use_colored_box`)
- **Decorated Box**: Use DecoratedBox instead of Container with only decoration (`use_decorated_box`)

### Running Analysis
```bash
# Run the analyzer
flutter analyze

# Run with verbose output
flutter analyze --verbose
```

### IDE Integration
- Configure your IDE to use the project's `analysis_options.yaml`
- Enable "Analyze on save" in your IDE settings
- Address all analyzer warnings and errors before committing code

## Best Practices

### 1. Immutability
- Use Freezed for all models
- Prefer const constructors where possible
- Use final variables

### 2. Error Handling
- Always handle errors in async operations
- Use try-catch blocks in providers
- Set error states in the UI

### 3. Performance
- Use const widgets where possible
- Avoid unnecessary rebuilds
- Use appropriate Riverpod providers (Provider vs FutureProvider vs StreamProvider)

### 4. Code Organization
- Keep files focused and single-purpose
- Extract complex logic into separate methods
- Use meaningful variable and method names

### 5. Testing
- Write unit tests for business logic
- Test providers with Riverpod testing utilities
- Mock external dependencies

## Common Patterns

### Provider Pattern
```dart
@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  @override
  ExampleState build() {
    return const ExampleState();
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    try {
      final data = await ref.read(repositoryProvider).fetchData();
      state = state.copyWith(
        data: data,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}
```

### State Pattern
```dart
@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    @Default(false) bool isLoading,
    @Default([]) List<Data> data,
    String? error,
  }) = _ExampleState;
}
```

## Dependencies

### Required Packages
- `freezed_annotation` - For immutable models
- `riverpod_annotation` - For state management
- `json_annotation` - For JSON serialization
- `google_fonts` - For web font support

### Development Dependencies
- `build_runner` - For code generation
- `freezed` - For model generation
- `riverpod_generator` - For provider generation
- `json_serializable` - For JSON generation

## File Structure Examples

### Model Example
```dart
// lib/domain/models/example/example.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example.freezed.dart';
part 'example.g.dart';

@freezed
class Example with _$Example {
  const factory Example({
    required String id,
    required String name,
  }) = _Example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}
```

### Provider Example
```dart
// lib/ui/views/example/bloc/provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  @override
  ExampleState build() {
    return const ExampleState();
  }
}
```

### Component Example
```dart
// lib/ui/views/example/layouts/components/example_widget.dart
import 'package:flutter/material.dart';
import 'package:clones_desktop/assets.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ClonesColors.primary,
      child: Text(
        'Example',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
```

## Summary

1. **Models**: Always use Freezed with `@freezed` annotation
2. **State Management**: Use Riverpod with `@riverpod` annotation
3. **UI Organization**: Separate bloc and layouts, break down large widgets
4. **Styling**: Use `Theme.of(context).textTheme` and `ClonesColors`
5. **Architecture**: Follow the established folder structure
6. **Code Generation**: Always run build_runner after changes
7. **Naming**: Use snake_case for files, PascalCase for classes 