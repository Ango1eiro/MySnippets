

```mermaid

<script>
  var callback = function () {
      alert('A callback was triggered');
  };
</script>

graph TD;
    MyApplication[HiltAndroidApp];
    MainActivity;
    HomeScreen-->HomeViewModel;
    HomeViewModel-->RepositoryModule;
    
    click MyApplication callback "Tooltip for a callback"
```
