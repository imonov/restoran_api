import express from "express";
import cors from "cors";
import { engine } from "express-handlebars";
import { createNewMeal, getAllMeals } from "./controller/meal.controller.js";

const app = express();
app.engine("handlebars", engine());

app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "handlebars");
app.set("views", "./views");

const PORT = 3000;
app.get("/", getAllMeals);

app.post("/meal", createNewMeal);

app.listen(PORT, () => {
    console.log(`Server running in ${PORT}`);
});
