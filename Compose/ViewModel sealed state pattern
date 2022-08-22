@Module
@InstallIn(SingletonComponent::class)
object  RestModule {

    @Provides
    fun provideBaseUrl() = "https://jsonplaceholder.typicode.com/"

    @Singleton
    @Provides
    fun provideRetrofit(baseUrl:String): Retrofit =
        Retrofit.Builder()
            .baseUrl(baseUrl)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

    @Provides
    @Singleton
    fun provideApiService(retrofit: Retrofit) = retrofit.create(UserServices::class.java)
}

sealed class State {
    object START : State()
    object LOADING : State()
    data class SUCCESS(val users: List<User>) : State()
    data class FAILURE(val message: String) : State()
}

@HiltViewModel
class MainViewModel
@Inject constructor(private val userServices: UserServices) : ViewModel() {

    val state = MutableStateFlow<State>(State.START)

    init {
        loadUser()
    }

    private fun loadUser() = viewModelScope.launch {
        state.value = State.LOADING
        try {
            val users = withContext(Dispatchers.IO) { userServices.getUsers() }
            state.value = State.SUCCESS(users)
        } catch (e: Exception) {
            state.value = State.FAILURE(e.localizedMessage)
        }
    }

}

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            UserActivityTheme {
                Scaffold(
                    topBar = {
                        TopAppBar(
                            title = { Text("MVVM StateManagement") },
                            backgroundColor = Color.Black,
                            contentColor = Color.White
                        )
                    },
                ) {
                    MainView()
                }
            }
        }
    }
}
@Composable
fun MainView() {
    val viewModel = hiltViewModel<MainViewModel>()
    val state by viewModel.state.collectAsState()
    when (state) {
        State.START -> {
        }
        State.LOADING -> {
            Box(contentAlignment = Alignment.Center, modifier = Modifier.fillMaxSize()) {
                CircularProgressIndicator()
            }
        }
        is State.FAILURE -> {
            Box(contentAlignment = Alignment.Center, modifier = Modifier.fillMaxSize()) {
                Text(text = "Something went wrong...",fontSize = 16.sp)
            }
        }
        is State.SUCCESS -> {
            val users = (state as State.SUCCESS).users
            UserListScreen(users)
        }
    }
}
@Composable
fun UserListScreen(users: List<User>) {
    LazyColumn(modifier = Modifier.fillMaxHeight()) {
        items(items = users) { item ->
            Row(modifier = Modifier.padding(8.dp),
                verticalAlignment = Alignment.CenterVertically) {
              
               Box(modifier = Modifier
                        .background(Color.Black, CircleShape)
                        .size(50.dp),
                    contentAlignment = Alignment.Center ){
                    Text(
                        text = item.name.substring(0, 1),
                        color = Color.White,
                        fontSize = 26.sp,
                        fontWeight = FontWeight.Bold)
                    }
                Column(
                    modifier = Modifier
                        .align(Alignment.CenterVertically)
                        .padding(start = 6.dp)
                ) {
                    Text(
                        text = item.name,
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.Black)
                    Text(
                        text = item.name, fontSize = 16.sp,
                        color = Color.Black,
                       modifier = Modifier.padding(top = 2.dp))
                }
            }
        }
    }
}
