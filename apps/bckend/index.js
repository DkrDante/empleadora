import express from "express";

const app = express();

app.use(express.json())
app.get("/health", (req, res) => {
  res.json({ data: "Server is live" });
})

app.listen(process.env.PORT, () => {
  console.log(`${Date.now()} Server started at port ${process.env.PORT}`);
})
