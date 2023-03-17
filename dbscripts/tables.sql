CREATE TABLE proj.CUSTOMER(
    User_ID int NOT NULL,
    Email varchar(30),
    Password varchar(50) NOT NULL,
    First_Name varchar(30),
    Last_Name varchar(30),
    PRIMARY KEY (User_ID)
);

CREATE TABLE proj.STORE(
    Store_ID int NOT NULL,
    Name varchar(50),
    Email varchar(30),
    Phone_NO int,
    PRIMARY KEY (Store_ID)
);

CREATE TABLE proj.ADMIN(
    User_ID int NOT NULL,
    SSN int NOT NULL,
    Phone_NO int,
    Email varchar(30),
    Password varchar(50) NOT NULL,
    First_Name varchar(30),
    Last_Name varchar(30),
    Store_ID int NOT NULL,
    Start_Date Date NOT NULL,
    PRIMARY KEY (User_ID),
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
);

CREATE TABLE proj.ITEM(
    Item_ID int NOT NULL,
    Name varchar(50) NOT NULL,
    Brand varchar(50),
    Description varchar(255),
    PRIMARY KEY (Item_ID)
);

CREATE TABLE proj.STOCK(
    Store_ID int NOT NULL,
    Item_ID int NOT NULL,
    Price int,
    Quantity int NOT NULL,
    PRIMARY KEY (Store_ID, Item_ID),
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID),
    FOREIGN KEY (Item_ID) REFERENCES ITEM(Item_ID)
);

CREATE TABLE proj.FAVORITE_LIST(
    Favorite_ID int NOT NULL,
    List_Name varchar(50) NOT NULL,
    User_ID int NOT NULL,
    PRIMARY KEY (FAVORITE_ID),
    FOREIGN KEY (User_ID) REFERENCES CUSTOMER(User_ID)
);

CREATE TABLE proj.FAVORITE_LIST_ITEMS(
    Favorite_ID int NOT NULL,
    Item_ID int NOT NULL,
    Quantity int,
    PRIMARY KEY (Favorite_ID, Item_ID),
    FOREIGN KEY (Favorite_ID) REFERENCES FAVORITE_LIST(Favorite_ID),
    FOREIGN KEY (Item_ID) REFERENCES ITEM(Item_ID)
);

CREATE TABLE proj.STORE_LOCATION(
    Store_ID int NOT NULL,
    Address varchar(50) NOT NULL,
    PRIMARY KEY (Store_ID),
    FOREIGN KEY (STORE_ID) REFERENCES STORE(Store_ID)
);

CREATE TABLE proj.CATEGORY(
    Category_ID int NOT NULL,
    Name varchar(30) NOT NULL,
    Description varchar(255),
    PRIMARY KEY (Category_ID)

);

CREATE TABLE proj.SUBCATEGORY(
    Sub_Category_ID int NOT NULL,
    Name varchar(30) NOT NULL,
    Description varchar(255),
    PRIMARY KEY (Sub_Category_ID)
);

CREATE TABLE proj.SUBCATEGORY_CATEGORY(
    Sub_Category_ID int NOT NULL,
    Category_ID int NOT NULL,
    PRIMARY KEY (Sub_Category_ID, Category_ID),
    FOREIGN KEY (Sub_Category_ID) REFERENCES SUBCATEGORY(Sub_Category_ID),
    FOREIGN KEY (Category_ID) REFERENCES CATEGORY(Category_ID)
);

CREATE TABLE proj.ITEM_SALE(
    Store_ID int NOT NULL,
    Item_ID int NOT NULL,
    Sale_Price int NOT NULL,
    Reduction_Amount int NOT NULL,
    Start_Date date NOT NULL,
    End_Date date,
    PRIMARY KEY (Store_ID, Item_ID),
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID),
    FOREIGN KEY (Item_ID) REFERENCES ITEM(Item_ID)
);

CREATE TABLE proj.ITEM_SUBCATEGORIES(
    Sub_Category_ID int NOT NULL,
    Item_ID int NOT NULL,
    PRIMARY KEY (Sub_Category_ID, Item_ID),
    FOREIGN KEY (Sub_Category_ID) REFERENCES SUBCATEGORY(Sub_Category_ID),
    FOREIGN KEY (Item_ID) REFERENCES ITEM(Item_ID)
);

CREATE TABLE proj.ORDER(
    Order_ID int NOT NULL,
    Date date NOT NULL,
    Amount int NOT NULL,
    Store_ID int NOT NULL,
    User_ID int NOT NULL,
    PRIMARY KEY (Order_ID),
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID),
    FOREIGN KEY (User_ID) REFERENCES CUSTOMER(User_ID)
);

CREATE TABLE proj.ORDER_ITEM(
    Order_Item_ID int NOT NULL,
    SubTotal int,
    Quantity int,
    Item_ID int NOT NULL,
    Order_ID int NOT NULL,
    PRIMARY KEY (ORDER_ITEM_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES `order`(Order_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES ITEM(Item_ID)
);