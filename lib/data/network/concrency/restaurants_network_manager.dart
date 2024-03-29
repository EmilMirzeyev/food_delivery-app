import '/data/dtos/food_dto.dart';
import '/data/dtos/restaurant_dto.dart';
import '/data/network/abstraction/i_food_delivery_restaurants_network_manager.dart';

var today = DateTime.now();
var fiftyDaysFromNow = today.add(const Duration(hours: 1));

class AddInfo {
  final dynamic id;
  final String info;
  final String icon;

  AddInfo({this.id, required this.info, required this.icon});
}

class RestaurantsNetworkManager extends IFoodDeliveryRestaurantsNetworkManager {
  @override
  Future<List<RestaurantDto>> getRestaurants() async {
    List<RestaurantDto> _dtos = [
      RestaurantDto(
        id: 1,
          title: "Noma",
          description:
              "Noma is a three-Michelin-star restaurant run by chef René Redzepi in Copenhagen, Denmark. The name is a syllabic abbreviation of the two Danish words 'nordisk' (Nordic) and 'mad' (food). Opened in 2003, the restaurant is known for its focus on foraging, invention and interpretation of New Nordic Cuisine. In 2010, 2011, 2012, and 2014, it was ranked as the Best Restaurant in the World by Restaurant magazine. In 2021 it won the first spot in the World's 50 Best Restaurants Awards.",
          location: "Denmark, Copenhagen,	Refshalevej 96",
          imageUrl: "assets/images/restaurants/noma.jpg",
          workingTimes: WorkingTimes(
              opening: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 16, 15),
              closing: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 21, 15)),
          rating: Rating(
            rate: 4.8,
            count: 56,
          ),
          foods: [
            FoodDto(
              id: 1,
              title: "Caesar",
              recipe: "Cucumber, tamoto, cheese, rye bread, sauce",
              price: 48.25,
              imageUrl: "assets/images/foods/sezar.jpg",
              category: "Salads",
              isPopular: false,
              rating: Rating(
                rate: 3.2,
                count: 41,
              ),
            ),
            FoodDto(
              id: 2,
              title: "Beef Wellington",
              recipe: "Beef, mushrooms, flour, eggs, butter",
              price: 48.25,
              imageUrl: "assets/images/foods/beef-wellington.jpg",
              category: "Meat",
              isPopular: true,
              rating: Rating(
                rate: 3.2,
                count: 41,
              ),
            ),
          ],
          additionalInfo: [
            AddInfo(info: "Terrace", icon: "assets/images/icons/terrace.png"),
            AddInfo(info: "Garage", icon: "assets/images/icons/garage.png"),
            AddInfo(info: "Swedish Table", icon: "assets/images/icons/swedish_table.png"),
            AddInfo(info: "Wifi", icon: "assets/images/icons/wifi.png"),
          ]),
      RestaurantDto(
        id: 2,
        title: "Geranium",
        description:
            "Geranium is a Danish gourmet restaurant, situated in Parken in the center of Copenhagen. The head chef is the Danish chef Rasmus Kofoed, who won the Bocuse d'Or in 2011. It was the first Danish three-starred restaurant according to the Michelin Guide beside Noma who received their three stars in 2021.",
        location: "Denmark, Copenhagen, H-Tarn, Parken",
        imageUrl: "assets/images/restaurants/geranium.jpg",
        workingTimes: WorkingTimes(
          opening: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 07, 15),
          closing: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 21, 00),
        ),
        rating: Rating(
          rate: 3.6,
          count: 62,
        ),
        additionalInfo: [],
        foods: [
          FoodDto(
            id: 3,
            title: "Beef Stroganoff",
            recipe: "Beef, mushrooms, onions, garlic, egg noodles, cream, salt",
            price: 42.00,
            imageUrl: "assets/images/foods/beef-stroganoff.webp",
            category: "Meat",
            isPopular: false,
            rating: Rating(
              rate: 3.2,
              count: 41,
            ),
          ),
          FoodDto(
            id: 4,
            title: "Reuben",
            recipe: "Swiss cheese, beef, margarine, rye bread",
            price: 48.25,
            imageUrl: "assets/images/foods/reuben.jpg",
            category: "Fast food",
            isPopular: true,
            rating: Rating(
              rate: 2.7,
              count: 311,
            ),
          ),
          FoodDto(
            id: 5,
            title: "Salisbury Steak",
            recipe: "Melted butter, tomato paste, mushrooms, onions, beef, crispy bread, milk, soy sauce",
            price: 125.72,
            imageUrl: "assets/images/foods/salisbury_steak.webp",
            category: "Meat",
            isPopular: false,
            rating: Rating(
              rate: 4.6,
              count: 481,
            ),
          ),
        ],
      ),
      RestaurantDto(
        id: 3,
        title: "Asador Etxebarri",
        description:
            "Asador Etxebarri is a Spanish restaurant in Atxondo (Biscay), Basque Country which was voted 3rd best of the World's 101 Best Steak Restaurants www.worldbeststeaks.com and was also voted 3rd best in the world in Restaurant (magazine) Top 50 Awards in 2019 and 2021 and 6th in 2015. The chef is Victor Arguinzoniz, who cooks everything over a grill.",
        location: "Spain, Bizkaia, Axpe",
        imageUrl: "assets/images/restaurants/Asador.jpg",
        workingTimes: WorkingTimes(
          opening: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 7, 15),
          closing: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 21, 00),
        ),
        rating: Rating(
          rate: 2.4,
          count: 23,
        ),
        additionalInfo: [
          AddInfo(info: "Delivery", icon: "assets/images/icons/delivery.png"),
          AddInfo(info: "Live Music", icon: "assets/images/icons/microphone.png"),
        ],
        foods: [
          FoodDto(
            id: 6,
            title: "Waldorf Salad",
            recipe: "Mayannaise, lemon juice, milk, apples, chopped nuts",
            price: 34.99,
            imageUrl: "assets/images/foods/waldorf_salad.jpg",
            category: "Salads",
            isPopular: false,
            rating: Rating(
              rate: 3.2,
              count: 41,
            ),
          ),
          FoodDto(
            id: 7,
            title: "Chicken a la King",
            recipe: "Butter, green pepper, flour, milk, chicken, jar",
            price: 15.80,
            imageUrl: "assets/images/foods/chicken_a_la_king.webp",
            category: "Meat",
            isPopular: true,
            rating: Rating(
              rate: 4.9,
              count: 80,
            ),
          ),
          FoodDto(
            id: 8,
            title: "Lobster Newburg",
            recipe: "Lobster chunks, seafood, tarragon leaves, butter, pepper and salt",
            price: 60.00,
            imageUrl: "assets/images/foods/lobster_newburg.webp",
            category: "Salads",
            isPopular: false,
            rating: Rating(
              rate: 3.8,
              count: 580,
            ),
          ),
        ],
      ),
      RestaurantDto(
        id: 4,
        title: "Atelier Crenn",
        description:
            "Atelier Crenn is a restaurant in the Cow Hollow neighborhood in San Francisco, California. Opened in 2011 by Dominique Crenn and Juan Contreras, the restaurant became the seventh restaurant in San Francisco Bay Area to be awarded three Michelin stars by the Michelin Guide in 2018.",
        location: "San Francisco, California",
        imageUrl: "assets/images/restaurants/atelier_crenn.jpg",
        workingTimes: WorkingTimes(
          opening: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 7, 15),
          closing: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 21, 00),
        ),
        rating: Rating(
          rate: 4.7,
          count: 7598,
        ),
        additionalInfo: [],
        foods: [
          FoodDto(
            id: 9,
            title: "Kir Breton",
            recipe: "Cidre, De la crème de fruits",
            price: 98,
            imageUrl: "assets/images/foods/kir_breton.jpg",
            category: "Sweetness",
            isPopular: true,
            rating: Rating(
              rate: 3.8,
              count: 938,
            ),
          ),
          FoodDto(
            id: 10,
            title: "Buckwheat Crackers",
            recipe: "Smoky and crunchy to the bite",
            price: 25,
            imageUrl: "assets/images/foods/buckwheat_crackers.jpg",
            category: "Bread",
            isPopular: false,
            rating: Rating(
              rate: 5,
              count: 75,
            ),
          ),
        ],
      ),
      RestaurantDto(
        id: 5,
        title: "Maaemo",
        description:
            "Maaemo is a Norwegian restaurant located in Dronning Eufemias gate in Oslo, Norway. In March 2012 it was awarded two stars in the Michelin Guide, the first time a Nordic restaurant has been awarded two stars in its first mention in the guide. The restaurant is run by Danish head chef, Esben Holmboe Bang.",
        location: "Oslo, Norway",
        imageUrl: "assets/images/restaurants/maaemo.jpeg",
        workingTimes: WorkingTimes(
          opening: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 7, 15),
          closing: DateTime(WorkingTimes.year, WorkingTimes.month, WorkingTimes.day, 21, 00),
        ),
        rating: Rating(
          rate: 4.8,
          count: 1209,
        ),
        additionalInfo: [],
        foods: [
          FoodDto(
            id: 11,
            title: "Sea Product",
            recipe: "Sea Product",
            price: 45,
            imageUrl: "assets/images/foods/sea_product.jpg",
            category: "Sweetness",
            isPopular: false,
            rating: Rating(
              rate: 4.5,
              count: 127,
            ),
          ),
          FoodDto(
            id: 12,
            title: "Lamb",
            recipe: "Lamb, sauce, wine",
            price: 125,
            imageUrl: "assets/images/foods/lamb.jpg",
            category: "true",
            isPopular: false,
            rating: Rating(
              rate: 5,
              count: 578,
            ),
          ),
        ],
      ),
    ];

    return _dtos;
  }
}
