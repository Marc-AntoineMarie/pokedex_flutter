class _HomeState extends State<Home> {
    List<Pokemon> pokemon = List.empty();

    @override
    void initState() {
        super.initState();
        getPokemonFromPokeApi();
    }

void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
    List<Map<String, dynamic>> data =
        List.from(json.decode(response.body)['results']);
    setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
                element.value['id'] = element.key + 1;
                element.value['img'] = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
                return Pokemon.fromJson(element.value);
            }).toList();
        });
    });
}