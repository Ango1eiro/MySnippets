

```mermaid



graph TD;
    MyApplication["@HiltAndroidApp<br>MyAplication"];
    MainActivity["@AndroidEntryPoint<br>MainActivity"];
    HomeScreen-->HomeViewModel;
    HomeViewModel-->RepositoryModule;
    

```
