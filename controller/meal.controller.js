import { pool } from "../db/connect_db.js";

export async function getAllMeals(req, res) {
    const result = await pool.query(
        "SELECT m.id,m.name AS name ,m.description,c.name AS c_name FROM meals AS m JOIN category AS c ON c.id = m.category_id;",
    );
    // console.log(result.rows);
    res.render("home", { data: result.rows });
}

export async function createNewMeal(req, res) {
    const { name, description, c_id } = req.body;

    const query = `
        INSERT INTO meals (name, description, category_id)
        VALUES ($1, $2, $3)
        RETURNING *
    `;

    const values = [name, description, c_id];
    console.log(values);

    const result = await pool.query(query, values);
    console.log(result.rows);
    res.redirect("/");
}
