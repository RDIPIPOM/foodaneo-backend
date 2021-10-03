import { connect } from '../database'

export const getDishes = async (req, res) => {
    const connection = await connect();
    const queryCategories = 'SELECT id, name FROM category WHERE landing_page = ?;';
    let [rowsCategories] = await connection.query(queryCategories, [req.query.landing_page]).catch(function (err) {
        console.log("Promise Rejected" + err);
    });
    rowsCategories = Object.values(JSON.parse(JSON.stringify(rowsCategories)));
    const query = 'SELECT dish_category.id_category, dish.id AS id_dish, dish.name AS dish_name, dish.description AS dish_description, restaurant.name AS restaurant_name, dish.price AS dish_price, dish.path_photography AS dish_path_photography FROM dish INNER JOIN dish_category ON dish.id = dish_category.id_dish INNER JOIN category ON dish_category.id_category = category.id INNER JOIN restaurant ON dish.id_restaurant = restaurant.id;';
    const [rowsDishes] = await connection.query(query).catch(function (err) {
        console.log("Promise Rejected" + err);
    });

    let result = []
    rowsCategories.forEach(category => {
        let dishes = []
        rowsDishes.forEach(dish => {
            if (category.id === dish.id_category)
                dishes.push(dish)
        });
        category["dishes"] = dishes
        result.push(category)
    });

    res.json(result)
}