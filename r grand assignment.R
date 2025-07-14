# Create the initial employee_profile list
employee_profile <- list(
  EmpID = 1001,
  Name = "Samreen Rafique",
  Department = "IT",
  Skills = c("R", "Python", "SQL"),
  Experience = 3,
  IsPermanent = TRUE
)

# 1. Print the structure of the list
cat("Structure of employee_profile:\n")
str(employee_profile)

# 2. Access and print the Department from the list
cat("\nDepartment:\n")
print(employee_profile$Department)

# 3. Access and print the first skill from the Skills vector
cat("\nFirst Skill:\n")
print(employee_profile$Skills[1])

# 4. Update the Experience value to 5
employee_profile$Experience <- 5

# 5. Add a new element to the list: Salary = 75000
employee_profile$Salary <- 75000

# 6. Add a new skill "Docker" to the existing Skills vector
employee_profile$Skills <- c(employee_profile$Skills, "Docker")

# 7. Replace the Department value with "DevOps"
employee_profile$Department <- "DevOps"

# 8. Remove the IsPermanent field from the list
employee_profile$IsPermanent <- NULL

# 9. Display the final employee_profile list
cat("\nFinal employee_profile:\n")
print(employee_profile)



orders <- data.frame(
  Order_ID = c(1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010),
  Customer_Name = c("Ayaan", "Fatima", "Zaid", "Ayesha", "Rayyan", "Hafsa", "Ibrahim", "Mariam", "Yusuf", "Zainab"),
  Product = c("Laptop", "Shirt", "Rice", "Book", "Smartphone", "Charger", "Dress", "Headphones", "Notebook", "Camera"),
  Category = c("Electronics", "Clothing", "Grocery", "Books", "Electronics", "Electronics", "Clothing", "Electronics", "Books", "Electronics"),
  Order_Date = as.Date(c("2025-07-01", "2025-07-02", "2025-07-03", "2025-07-04", "2025-07-05", "2025-07-06", "2025-07-07", "2025-07-08", "2025-07-09", "2025-07-10")),
  Quantity = c(1, 2, 5, 3, 1, 2, 4, 1, 6, 2),
  Price_per_Unit = c(60000, 2500, 300, 2200, 80000, 5000, 6500, 9000, 700, 85000)
)

print(orders)

# 1. Display orders from row 2 to row 6
print(orders[2:6, ])

# 2. Filter and show all orders in the "Electronics" category
subset(orders, Category == "Electronics")

# 3. Show all orders where Quantity is more than 3
subset(orders, Quantity > 3)

# 4. Delete the column "Order Date"
orders$Order_Date <- NULL

# 5. Delete the row where Order ID is 1003
orders <- subset(orders, Order_ID != 1003)

# 6. Add a new column Total Price = Quantity × Price per Unit
orders$Total_Price <- orders$Quantity * orders$Price_per_Unit

# 7. Add a new column Status based on Quantity
orders$Status <- ifelse(orders$Quantity >= 5, "Bulk", "Standard")

# 8. Replace Category “Books” with “Bookstore”
orders$Category <- gsub("Books", "Bookstore", orders$Category)

# 9. Save the updated DataFrame as orders_data.csv
write.csv(orders, "orders_data.csv", row.names = FALSE)

# 10. Display only the Product and Quantity columns
orders[, c("Product", "Quantity")]

# 11. Show orders where price per unit > 5000
subset(orders, Price_per_Unit > 5000)

# 12. Show orders where quantity < 2
subset(orders, Quantity < 2)

# 13. Show orders where the total price > 10000
subset(orders, Total_Price > 10000)
# 14. Add column Delivery Charge: 0 if total price ≥ 10000 else 200
orders$Delivery_Charge <- ifelse(orders$Total_Price >= 10000, 0, 200)

# 15. Delete row where Order ID is 1006
orders <- subset(orders, Order_ID != 1006)

# 16. Save all "Clothing" category orders to a new file
clothing_orders <- subset(orders, Category == "Clothing")
write.csv(clothing_orders, "clothing_orders.csv", row.names = FALSE)

# 17. Remove rows where the product is "Charger"
orders <- subset(orders, Product != "Charger")


# 18. Delete all rows where category is “Grocery”
orders <- subset(orders, Category != "Grocery")

# 19. Delete all rows where total price is 0
orders <- subset(orders, Total_Price != 0)

# 20. Show orders where status is "Standard" and category is "Electronics"
subset(orders, Status == "Standard" & Category == "Electronics")

# 21. Remove rows where quantity is less than 2 and category is "Bookstore"
orders <- subset(orders, !(Quantity < 2 & Category == "Bookstore"))

# 22. Remove all rows where customer name is "Ali"
orders <- subset(orders, Customer_Name != "Ali")
print(orders)
