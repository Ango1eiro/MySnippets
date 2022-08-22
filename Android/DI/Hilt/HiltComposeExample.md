

```mermaid
graph TD;
    MyApplication[@HiltAndroidApp];
    MainActivity;
    HomeScreen-->HomeViewModel;
    HomeViewModel-->RepositoryModule;
```
