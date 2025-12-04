const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

// Route example
app.get("/", (req, res) => {
  res.send("Hello! Your Node server is running inside Docker 🚀");
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
