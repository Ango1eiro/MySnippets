

```mermaid



graph TD;
    MyApplication[HiltAndroidApp];
    MainActivity;
    HomeScreen-->HomeViewModel;
    HomeViewModel-->RepositoryModule;
    
    <script>
  var callback = function () {
      alert('A callback was triggered');
  };
</script>
    click MyApplication callback "Tooltip for a callback"
```
