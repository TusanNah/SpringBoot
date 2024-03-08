-- Create database if it does not exist
use master
go




IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'FlowerShop')
BEGIN
    CREATE DATABASE FlowerShop;
END;
GO
-- Use FlowerShop database
USE FlowerShop
GO
-- Check if User table exists
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '_User')
BEGIN
    -- Create User table
    CREATE TABLE _User (
        id INT IDENTITY(1,1) PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255),
        birthday DATE,
        address VARCHAR(255)
    );
END;

-- Check if Account table exists
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Account')
BEGIN
    -- Create Account table
    CREATE TABLE Account (
        id INT IDENTITY(1,1) PRIMARY KEY,
        balance DECIMAL(10, 2),
        user_id INT FOREIGN KEY REFERENCES _User(id)
    );
END;
-- Check if Category table exists
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Category')
BEGIN
    -- Create category table
    CREATE TABLE Category (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name VARCHAR(255) NOT NULL
    );
END;
GO

-- Check if Product table exists
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Product')
BEGIN
    -- Create product table with description field
    CREATE TABLE Product (
        id INT IDENTITY(1,1) PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description TEXT, -- Added description field
        price DECIMAL(10, 2) NOT NULL,
        stock_quantity INT NOT NULL,
        image VARCHAR(255),
        category_id INT,
        FOREIGN KEY (category_id) REFERENCES Category(id)
    );
END;
GO
;


-- Insert sample data into Category table
INSERT INTO Category (name) VALUES
    ('Roses'),
    ('Lilies'),
    ('Tulips'),
    ('Orchids'),
    ('Sunflowers');

--Insert sample data into Product
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
    ('Red Rose Bouquet', 'A beautiful bouquet of red roses.', 29.99, 50, 'https://example.com/red-rose.jpg', 1),
    ('White Lily Bouquet', 'Elegant white lilies arranged in a bouquet.', 39.99, 30, 'https://example.com/white-lily.jpg', 2),
    ('Colorful Tulip Mix', 'Vibrant mix of tulips in various colors.', 24.99, 75, 'https://example.com/colorful-tulip.jpg', 3),
    ('Orchid Plant', 'Phalaenopsis orchid potted plant.', 49.99, 20, 'https://example.com/orchid-plant.jpg', 4),
    ('Sunflower Bouquet', 'Cheerful bouquet featuring bright sunflowers.', 19.99, 60, 'https://example.com/sunflower-bouquet.jpg', 5),
    ('Pink Rose Bouquet', 'Lovely pink roses arranged in a bouquet.', 27.99, 40, 'https://example.com/pink-rose.jpg', 1),
    ('Easter Lily Bouquet', 'Festive bouquet for Easter celebrations.', 34.99, 25, 'https://example.com/easter-lily.jpg', 2),
    ('Rainbow Tulip Mix', 'Colorful tulips in a delightful mix.', 22.99, 60, 'https://example.com/rainbow-tulip.jpg', 3),
    ('Phalaenopsis Orchid', 'Elegant dendrobium orchid arrangement.', 59.99, 15, 'https://example.com/dendrobium-orchid.jpg', 4),
    ('Autumn Sunflower Bouquet', 'Warm hues of sunflowers for autumn.', 21.99, 45, 'https://example.com/autumn-sunflower.jpg', 5),
    ('Mixed Rose and Lily Bouquet', 'Combination of roses and lilies in one bouquet.', 49.99, 35, 'https://example.com/mixed-rose-lily.jpg', 1),
    ('Calla Lily Arrangement', 'Artistic arrangement featuring calla lilies.', 44.99, 18, 'https://example.com/calla-lily.jpg', 2),
    ('Purple Tulip Bouquet', 'Rich purple tulips arranged in a stunning bouquet.', 26.99, 55, 'https://example.com/purple-tulip.jpg', 3),
    ('Dendrobium Orchid', 'Graceful dendrobium orchid display.', 54.99, 12, 'https://example.com/dendrobium-orchid-2.jpg', 4),
    ('Summer Sunflower Bouquet', 'Bright and vibrant sunflowers for summer.', 23.99, 50, 'https://example.com/summer-sunflower.jpg', 5),
    ('Yellow Rose Bouquet', 'Sunny yellow roses in a beautiful arrangement.', 31.99, 48, 'https://example.com/yellow-rose.jpg', 1),
    ('Blue Lily Bouquet', 'Exquisite blue lilies arranged artistically.', 42.99, 28, 'https://example.com/blue-lily.jpg', 2),
    ('Spring Tulip Mix', 'Fresh tulips in a mix of spring colors.', 27.99, 65, 'https://example.com/spring-tulip.jpg', 3),
    ('Cymbidium Orchid', 'Cymbidium orchids in an elegant display.', 56.99, 18, 'https://example.com/cymbidium-orchid.jpg', 4),
    ('Golden Sunflower Bouquet', 'Radiant sunflowers in shades of gold.', 17.99, 55, 'https://example.com/golden-sunflower.jpg', 5),
    ('Exotic Rose and Orchid Mix', 'A unique mix of exotic roses and orchids.', 47.99, 32, 'https://example.com/exotic-rose-orchid.jpg', 1),
    ('Tropical Lily Arrangement', 'Tropical lilies arranged for a vibrant display.', 49.99, 20, 'https://example.com/tropical-lily.jpg', 2),
    ('Pink and White Tulip Bouquet', 'Harmony of pink and white tulips in a bouquet.', 29.99, 58, 'https://example.com/pink-white-tulip.jpg', 3),
    ('Miltonia Orchid', 'Miltonia orchid in a stunning pot arrangement.', 64.99, 15, 'https://example.com/miltonia-orchid.jpg', 4),
    ('Autumn Maple Sunflower Bouquet', 'Sunflowers complemented by autumn maple leaves.', 25.99, 42, 'https://example.com/autumn-maple-sunflower.jpg', 5),
    ('Cherry Blossom Bouquet', 'Delicate cherry blossoms in a charming bouquet.', 33.99, 45, 'https://example.com/cherry-blossom.jpg', 1),
    ('Purple Orchid Elegance', 'Elegant arrangement of deep purple orchids.', 49.99, 22, 'https://example.com/purple-orchid.jpg', 4),
    ('Sunny Yellow Tulip Bouquet', 'Bright yellow tulips to bring sunshine.', 26.99, 60, 'https://example.com/yellow-tulip.jpg', 3),
    ('Cascading Lily Cascade', 'Cascading lilies for a stunning visual impact.', 54.99, 18, 'https://example.com/cascading-lily.jpg', 2),
    ('Vivid Dahlia Delight', 'Vivid dahlias arranged for a delightful display.', 21.99, 55, 'https://example.com/vivid-dahlia.jpg', 3),
    ('Classic Red Carnations', 'Classic red carnations in a timeless arrangement.', 19.99, 50, 'https://example.com/red-carnation.jpg', 1),
    ('Green Orchid Harmony', 'Harmonious green orchids for a serene ambiance.', 44.99, 25, 'https://example.com/green-orchid.jpg', 4),
    ('Springtime Daffodil Bouquet', 'Daffodils to celebrate the beauty of spring.', 28.99, 40, 'https://example.com/spring-daffodil.jpg', 3),
    ('Radiant Sunflower Radiance', 'Radiant sunflowers for a cheerful atmosphere.', 23.99, 48, 'https://example.com/radiant-sunflower.jpg', 5),
    ('Exotic Protea Fusion', 'Exotic proteas in a fusion of colors.', 37.99, 30, 'https://example.com/exotic-protea.jpg', 1),
	('Lavender Bliss Bouquet', 'Lavender flowers for a blissful bouquet.', 31.99, 48, 'https://example.com/lavender-bliss.jpg', 1),
    ('Golden Iris Elegance', 'Elegant arrangement of golden irises.', 44.99, 22, 'https://example.com/golden-iris.jpg', 2),
    ('Spring Daisy Mix', 'Daisies in a delightful mix to welcome spring.', 26.99, 60, 'https://example.com/spring-daisy.jpg', 3),
    ('Radiant Orchid Majesty', 'Radiant orchids in a majestic display.', 53.99, 15, 'https://example.com/radiant-orchid.jpg', 4),
	('Golden Sunset Rose Bouquet', 'Captivating roses in hues of a golden sunset.', 34.99, 45, 'https://example.com/golden-sunset-rose.jpg', 1),
    ('Enchanted Orchid Garden', 'An enchanted garden of various orchid varieties.', 54.99, 25, 'https://example.com/enchanted-orchid-garden.jpg', 4),
    ('Spring Butterfly Tulip Mix', 'Tulips in a mix of colors, attracting spring butterflies.', 28.99, 55, 'https://example.com/spring-butterfly-tulip.jpg', 3),
    ('Sunny Gerbera Daisy Bouquet', 'Cheerful gerbera daisies in a sunny arrangement.', 19.99, 60, 'https://example.com/sunny-gerbera-daisy.jpg', 1),
    ('Pastel Peony Perfection', 'Pastel peonies arranged for a perfect floral display.', 42.99, 30, 'https://example.com/pastel-peony.jpg', 2),
    ('Midsummer Night''s Dream Mix', 'A dreamy mix of flowers for a midsummer night.', 31.99, 40, 'https://example.com/midsummer-nights-dream.jpg', 3),
    ('Deep Burgundy Calla Lily Arrangement', 'Deep burgundy calla lilies in an elegant arrangement.', 46.99, 18, 'https://example.com/deep-burgundy-calla-lily.jpg', 2),
    ('Sunset Serenade Sunflower Bouquet', 'Sunflowers in a serenade of colors resembling a sunset.', 23.99, 50, 'https://example.com/sunset-serenade-sunflower.jpg', 5),
    ('Tea Rose Elegance', 'Elegant tea roses arranged for a refined display.', 39.99, 35, 'https://example.com/tea-rose-elegance.jpg', 1),
    ('Daisy Delightful Mix', 'Daisies in a delightful mix for a cheerful ambiance.', 26.99, 48, 'https://example.com/daisy-delightful-mix.jpg', 3),
    ('Exquisite Cascade of Wildflowers', 'A cascade arrangement featuring exquisite wildflowers.', 49.99, 22, 'https://example.com/exquisite-cascade-wildflowers.jpg', 4),
    ('Azure Blue Hydrangea Bouquet', 'Hydrangeas in a stunning azure blue bouquet.', 29.99, 58, 'https://example.com/azure-blue-hydrangea.jpg', 2),
    ('Harvest Moon Sunflower Bouquet', 'Sunflowers in warm tones reminiscent of a harvest moon.', 21.99, 42, 'https://example.com/harvest-moon-sunflower.jpg', 5),
    ('Pink Peony Passion', 'Passionate pink peonies in an exquisite floral arrangement.', 36.99, 32, 'https://example.com/pink-peony-passion.jpg', 1),
    ('Dancing Orchid Symphony', 'Orchids arranged in a symphony of colors, dancing with elegance.', 59.99, 20, 'https://example.com/dancing-orchid-symphony.jpg', 4),
    ('Majestic Red and White Rose Mix', 'A mix of majestic red and white roses for a regal display.', 44.99, 28, 'https://example.com/majestic-red-white-rose-mix.jpg', 1),
	('Ocean Breeze Orchid Arrangement', 'Orchids in shades of blue for a refreshing ocean breeze feel.', 48.99, 18, 'https://example.com/ocean-breeze-orchid.jpg', 4),
    ('Charming Lavender Rose Bouquet', 'Lavender roses arranged for a charming and romantic bouquet.', 33.99, 28, 'https://example.com/charming-lavender-rose.jpg', 1),
    ('Golden Harvest Sunflower Bouquet', 'Sunflowers in warm golden tones, perfect for the harvest season.', 22.99, 38, 'https://example.com/golden-harvest-sunflower.jpg', 5),
    ('Royal Purple Iris Elegance', 'Royal purple irises arranged in an elegant and regal display.', 39.99, 25, 'https://example.com/royal-purple-iris.jpg', 2),
    ('Emerald Green Orchid Splendor', 'Emerald green orchids arranged for a splendid and vibrant display.', 54.99, 15, 'https://example.com/emerald-green-orchid.jpg', 4),
    ('Winter Frost Rose Bouquet', 'White roses in a frosty arrangement, perfect for the winter season.', 29.99, 32, 'https://example.com/winter-frost-rose.jpg', 1),
    ('Sapphire Blue Tulip Mix', 'Tulips in shades of sapphire blue, creating a stunning and vibrant mix.', 26.99, 42, 'https://example.com/sapphire-blue-tulip.jpg', 3),
    ('Goldenrod Sunflower Radiance', 'Sunflowers in radiant goldenrod hues, bringing warmth and radiance.', 19.99, 50, 'https://example.com/goldenrod-sunflower.jpg', 5),
    ('Enchanting Calla Lily Cascade', 'Calla lilies arranged in an enchanting cascading display.', 44.99, 20, 'https://example.com/enchanting-calla-lily.jpg', 2),
    ('Peach Blossom Tulip Bouquet', 'Tulips in delightful peach blossom hues, creating a charming bouquet.', 31.99, 48, 'https://example.com/peach-blossom-tulip.jpg', 3),
    ('Midnight Serenade Orchid Mix', 'Orchids in a mix of midnight hues, creating a serene and captivating display.', 56.99, 18, 'https://example.com/midnight-serenade-orchid.jpg', 4),
    ('Blush Pink Peony Elegance', 'Blush pink peonies arranged for an elegant and romantic floral display.', 42.99, 25, 'https://example.com/blush-pink-peony.jpg', 1),
    ('Autumn Glow Daisy Mix', 'Daisies in warm autumn tones, creating a cheerful and glowing mix.', 26.99, 60, 'https://example.com/autumn-glow-daisy.jpg', 3),
    ('Crimson Rose and Lily Symphony', 'A symphony of crimson roses and lilies for a rich and vibrant display.', 49.99, 22, 'https://example.com/crimson-rose-lily-symphony.jpg', 1),
    ('Azure Sky Hydrangea Bliss', 'Hydrangeas in shades of azure blue, creating a blissful and calming arrangement.', 34.99, 38, 'https://example.com/azure-sky-hydrangea.jpg', 2),
    ('Golden Daffodil Sunshine', 'Daffodils in radiant golden hues, bringing sunshine and brightness.', 21.99, 48, 'https://example.com/golden-daffodil.jpg', 3),
    ('Regal Orchid and Rose Fusion', 'A fusion of regal orchids and roses for a majestic and luxurious arrangement.', 59.99, 15, 'https://example.com/regal-orchid-rose-fusion.jpg', 4);
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
	 ('Vivid Violet Tulip Bouquet', 'Vibrant violet tulips arranged for a stunning and lively bouquet.', 28.99, 35, 'https://example.com/vivid-violet-tulip.jpg', 3),
    ('Sunset Orange Tulip Mix', 'Tulips in warm sunset orange tones, creating a picturesque and vibrant mix.', 24.99, 45, 'https://example.com/sunset-orange-tulip.jpg', 3),
    ('Springtime Cherry Blossom Delight', 'Cherry blossoms in delightful springtime hues, bringing joy and freshness.', 31.99, 30, 'https://example.com/springtime-cherry-blossom.jpg', 3),
    ('Pastel Rainbow Tulip Mix', 'Tulips in a pastel rainbow of colors, creating a cheerful and whimsical mix.', 22.99, 55, 'https://example.com/pastel-rainbow-tulip.jpg', 3),
    ('Exotic Orchid Fantasy', 'Exotic orchids arranged for a fantasy-like display, capturing the imagination.', 39.99, 20, 'https://example.com/exotic-orchid-fantasy.jpg', 3),
    -- Additional data for category_id = 5
    ('Crimson and Gold Sunflower Elegance', 'Sunflowers in a combination of rich crimson and gold hues for an elegant display.', 42.99, 25, 'https://example.com/crimson-gold-sunflower.jpg', 5),
    ('Autumn Harvest Cornucopia', 'A cornucopia arrangement featuring autumn harvest-inspired flowers and foliage.', 48.99, 18, 'https://example.com/autumn-harvest-cornucopia.jpg', 5),
    ('Golden Wheat Sunflower Bouquet', 'Sunflowers complemented by golden wheat for a rustic and harvest-inspired bouquet.', 36.99, 22, 'https://example.com/golden-wheat-sunflower.jpg', 5),
    ('Radiant Marigold Sunflower Mix', 'Sunflowers mixed with radiant marigolds for a burst of color and warmth.', 29.99, 28, 'https://example.com/radiant-marigold-sunflower.jpg', 5),
    ('Amber Glow Sunflower Symphony', 'A symphony of sunflowers in warm amber tones, creating a vibrant and glowing display.', 34.99, 32, 'https://example.com/amber-glow-sunflower.jpg', 5),
	('Spring Blossom Tulip Mix', 'Tulips in a mix of springtime blossoms, creating a vibrant and refreshing bouquet.', 26.99, 40, 'https://example.com/spring-blossom-tulip.jpg', 3),
    ('Ocean Blue Hydrangea Elegance', 'Hydrangeas in shades of ocean blue, arranged for an elegant and calming display.', 36.99, 30, 'https://example.com/ocean-blue-hydrangea.jpg', 3),
    ('Whimsical Daisy and Delphinium Bouquet', 'Daisies and delphiniums arranged in a whimsical and cheerful bouquet.', 32.99, 35, 'https://example.com/whimsical-daisy-delphinium.jpg', 3),
    ('Majestic Purple Tulip Cascade', 'Purple tulips arranged in a cascading display for a majestic and stunning effect.', 45.99, 25, 'https://example.com/majestic-purple-tulip.jpg', 3),
    ('Sunrise Yellow Tulip Mix', 'Tulips in hues of sunrise yellow, creating a warm and inviting mix.', 28.99, 45, 'https://example.com/sunrise-yellow-tulip.jpg', 3),

    -- Additional data for category_id = 5
    ('Rustic Autumn Sunflower Basket', 'Sunflowers arranged in a rustic basket, perfect for an autumn-inspired setting.', 38.99, 20, 'https://example.com/rustic-autumn-sunflower.jpg', 5),
    ('Harvest Moon Cornflower Delight', 'Cornflowers arranged in hues reminiscent of a harvest moon, creating a delightful display.', 33.99, 28, 'https://example.com/harvest-moon-cornflower.jpg', 5),
    ('Crimson Maple Sunflower Bouquet', 'Sunflowers accompanied by crimson maple leaves for a rich and autumnal bouquet.', 41.99, 18, 'https://example.com/crimson-maple-sunflower.jpg', 5),
    ('Golden Autumn Daisy Mix', 'Daisies in golden autumn tones, creating a mix that captures the essence of fall.', 29.99, 32, 'https://example.com/golden-autumn-daisy.jpg', 5),
    ('Autumn Harvest Sunflower Radiance', 'Sunflowers in radiant tones symbolizing the warmth of autumn harvest.', 24.99, 40, 'https://example.com/autumn-harvest-sunflower-radiance.jpg', 5);
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
	  -- Additional data for category_id = 1
    ('Red Velvet Rose Elegance', 'Red velvet roses arranged for an elegant and luxurious floral display.', 54.99, 15, 'https://example.com/red-velvet-rose.jpg', 1),
    ('Springtime Love Rose Mix', 'Roses in a mix of springtime hues, creating a display that radiates love and warmth.', 49.99, 20, 'https://example.com/springtime-love-rose.jpg', 1),
    ('Blushing Bride Rose Cascade', 'Roses arranged in a cascading display, perfect for a blushing bride.', 59.99, 12, 'https://example.com/blushing-bride-rose.jpg', 1),
    ('Sunset Blaze Rose Bouquet', 'Roses in shades of a fiery sunset, creating a vibrant and eye-catching bouquet.', 44.99, 18, 'https://example.com/sunset-blaze-rose.jpg', 1),
    ('Classic Red Carnation Elegance', 'Classic red carnations arranged for a timeless and elegant floral arrangement.', 39.99, 25, 'https://example.com/classic-red-carnation-elegance.jpg', 1),

    -- Additional data for category_id = 4
    ('Tropical Paradise Orchid Mix', 'Orchids in a mix of tropical hues, creating a paradise-inspired and exotic floral display.', 62.99, 10, 'https://example.com/tropical-paradise-orchid.jpg', 4),
    ('Mystical Blue Dendrobium Elegance', 'Blue dendrobium orchids arranged for a mystical and enchanting floral arrangement.', 49.99, 18, 'https://example.com/mystical-blue-dendrobium.jpg', 4),
    ('Eternal White Phalaenopsis Orchid', 'White phalaenopsis orchids arranged for an eternal and timeless display.', 59.99, 15, 'https://example.com/eternal-white-phalaenopsis.jpg', 4),
    ('Radiant Pink Cymbidium Orchid Cascade', 'Pink cymbidium orchids arranged in a cascading display for a radiant and captivating effect.', 54.99, 12, 'https://example.com/radiant-pink-cymbidium.jpg', 4),
    ('Orchid Fantasy Cascade', 'A fantasy-inspired cascade of various orchids, creating a whimsical and magical floral arrangement.', 69.99, 8, 'https://example.com/orchid-fantasy-cascade.jpg', 4),
	-- Additional data for category_id = 1
    ('Pure White Rose Elegance', 'Pure white roses arranged for a timeless and elegant floral display.', 49.99, 20, 'https://example.com/pure-white-rose.jpg', 1),
    ('Romantic Red Rose Heart Bouquet', 'A heart-shaped bouquet of romantic red roses, perfect for expressing love.', 59.99, 15, 'https://example.com/romantic-red-rose-heart.jpg', 1),
    ('Enchanted Garden Rose Mix', 'A mix of roses reminiscent of an enchanted garden, creating a magical floral arrangement.', 54.99, 18, 'https://example.com/enchanted-garden-rose.jpg', 1),
    ('Sunrise Splendor Rose Bouquet', 'Roses in hues of sunrise splendor, creating a warm and vibrant bouquet.', 44.99, 25, 'https://example.com/sunrise-splendor-rose.jpg', 1),
    ('Golden Anniversary Rose Cascade', 'Golden roses arranged in a cascade, perfect for celebrating a golden anniversary.', 64.99, 12, 'https://example.com/golden-anniversary-rose.jpg', 1),

    -- Additional data for category_id = 4
    ('Majestic Purple Dendrobium Elegance', 'Purple dendrobium orchids arranged for a majestic and regal floral display.', 59.99, 15, 'https://example.com/majestic-purple-dendrobium.jpg', 4),
    ('Golden Cymbidium Orchid Bliss', 'Golden cymbidium orchids arranged for a blissful and luxurious floral arrangement.', 69.99, 12, 'https://example.com/golden-cymbidium-orchid.jpg', 4),
    ('Eternal Love Phalaenopsis Orchid', 'Phalaenopsis orchids arranged to symbolize eternal love and beauty.', 54.99, 18, 'https://example.com/eternal-love-phalaenopsis.jpg', 4),
    ('Radiant Blue Orchid Cascade', 'Blue orchids arranged in a cascading display for a radiant and captivating effect.', 74.99, 10, 'https://example.com/radiant-blue-orchid-cascade.jpg', 4),
    ('Orchid Serenity Bouquet', 'A serene bouquet featuring a variety of orchids in calming hues.', 49.99, 20, 'https://example.com/orchid-serenity-bouquet.jpg', 4),
	-- Additional data for category_id = 1 (Roses)
    ('Elegant Ivory Rose Bouquet', 'An elegant bouquet featuring ivory roses for a classic and sophisticated look.', 47.99, 22, 'https://example.com/elegant-ivory-rose.jpg', 1),
    ('Passionate Pink Rose Elegance', 'Passionate pink roses arranged for a vibrant and romantic floral display.', 52.99, 18, 'https://example.com/passionate-pink-rose.jpg', 1),
    ('Whispering Lilac Rose Cascade', 'Lilac roses arranged in a cascading display, creating a whispering and enchanting effect.', 59.99, 15, 'https://example.com/whispering-lilac-rose.jpg', 1),
    ('Midnight Magic Black Rose Bouquet', 'Black roses arranged for a unique and mysterious bouquet, perfect for special occasions.', 64.99, 12, 'https://example.com/midnight-magic-black-rose.jpg', 1),
    ('Sun-Kissed Orange Rose Mix', 'A mix of sun-kissed orange roses, creating a warm and cheerful bouquet.', 42.99, 25, 'https://example.com/sun-kissed-orange-rose.jpg', 1),

    -- Additional data for category_id = 2 (Lilies)
    ('Royal Blue Lily Symphony', 'Lilies in royal blue hues arranged for a symphony of elegance and grace.', 49.99, 20, 'https://example.com/royal-blue-lily.jpg', 2),
    ('Sunny Yellow Lily Bouquet', 'Lilies in bright and sunny yellow tones, perfect for bringing warmth and joy.', 39.99, 28, 'https://example.com/sunny-yellow-lily.jpg', 2),
    ('Graceful Pink Lily Cascade', 'Pink lilies arranged in a cascading display, creating a graceful and feminine bouquet.', 44.99, 25, 'https://example.com/graceful-pink-lily.jpg', 2),
    ('Autumn Gold Lily Mix', 'Lilies in autumn gold tones, capturing the essence of fall in a beautiful bouquet.', 34.99, 32, 'https://example.com/autumn-gold-lily.jpg', 2),
    ('Purple Majesty Lily Elegance', 'Lilies in shades of purple, arranged for a majestic and regal floral display.', 54.99, 18, 'https://example.com/purple-majesty-lily.jpg', 2),

    -- Additional data for category_id = 3 (Tulips)
    ('Harmony of Harmony Tulip Mix', 'A harmonious mix of tulips in various colors, creating a delightful and cheerful display.', 28.99, 35, 'https://example.com/harmony-of-harmony-tulip.jpg', 3),
    ('Deep Burgundy Tulip Elegance', 'Deep burgundy tulips arranged for an elegant and rich floral arrangement.', 36.99, 30, 'https://example.com/deep-burgundy-tulip.jpg', 3),
    ('Fiesta Fiesta Tulip Mix', 'A fiesta of tulips in a vibrant mix of colors, perfect for celebrating joyous occasions.', 32.99, 35, 'https://example.com/fiesta-fiesta-tulip.jpg', 3),
    ('Twilight Blue Tulip Cascade', 'Tulips in twilight blue hues arranged in a cascading display, creating a mesmerizing effect.', 45.99, 25, 'https://example.com/twilight-blue-tulip.jpg', 3),
    ('Golden Harvest Tulip Bouquet', 'Tulips in hues of golden harvest, symbolizing warmth and abundance.', 38.99, 20, 'https://example.com/golden-harvest-tulip.jpg', 3),

    -- Additional data for category_id = 4 (Orchids)
    ('Majestic White Phalaenopsis Elegance', 'White phalaenopsis orchids arranged for a majestic and sophisticated floral display.', 62.99, 10, 'https://example.com/majestic-white-phalaenopsis.jpg', 4),
    ('Radiant Rainbow Dendrobium Mix', 'A radiant mix of rainbow-colored dendrobium orchids, creating a joyful and lively arrangement.', 49.99, 18, 'https://example.com/radiant-rainbow-dendrobium.jpg', 4),
    ('Tropical Sunset Cymbidium Bouquet', 'Cymbidium orchids in hues of a tropical sunset, perfect for creating a warm and exotic ambiance.', 59.99, 15, 'https://example.com/tropical-sunset-cymbidium.jpg', 4),
    ('Enchanting Pink Orchid Cascade', 'Pink orchids arranged in a cascading display, creating an enchanting and romantic effect.', 54.99, 12, 'https://example.com/enchanting-pink-orchid.jpg', 4),
    ('Azure Blue Orchid Elegance', 'Blue orchids arranged for an elegant and serene floral display.', 49.99, 20, 'https://example.com/azure-blue-orchid.jpg', 4),

    -- Additional data for category_id = 5 (Sunflowers)
    ('Golden Fields Sunflower Symphony', 'Sunflowers arranged for a symphony of golden fields, capturing the beauty of a sunny day.', 42.99, 25, 'https://example.com/golden-fields-sunflower.jpg', 5),
    ('Radiant Red Sunflower Cascade', 'Red sunflowers arranged in a cascading display, creating a radiant and eye-catching effect.', 38.99, 20, 'https://example.com/radiant-red-sunflower.jpg', 5),
    ('Whimsical Autumn Sunflower Mix', 'A whimsical mix of sunflowers in autumn-inspired hues, perfect for celebrating the fall season.', 44.99, 18, 'https://example.com/whimsical-autumn-sunflower.jpg', 5),
    ('Sunny Yellow Sunflower Bouquet', 'Bright and sunny yellow sunflowers arranged for a cheerful and uplifting bouquet.', 34.99, 22, 'https://example.com/sunny-yellow-sunflower.jpg', 5),
    ('Harvest Moon Sunflower Bliss', 'Sunflowers arranged in hues reminiscent of a harvest moon, creating a blissful and warm display.', 29.99, 28, 'https://example.com/harvest-moon-sunflower.jpg', 5)

	INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
	VALUES
    ('Majestic White Lily Elegance', 'White lilies arranged for a majestic and sophisticated floral display.', 49.99, 20, 'https://example.com/majestic-white-lily.jpg', 2),
    ('Sunset Orange Lily Cascade', 'Orange lilies arranged in a cascading display, creating a warm and vibrant bouquet.', 44.99, 18, 'https://example.com/sunset-orange-lily.jpg', 2),
    ('Blissful Pink Lily Bouquet', 'Pink lilies arranged for a blissful and feminine floral arrangement.', 39.99, 25, 'https://example.com/blissful-pink-lily.jpg', 2),
    ('Regal Purple Lily Symphony', 'Purple lilies arranged for a regal and harmonious floral display.', 54.99, 15, 'https://example.com/regal-purple-lily.jpg', 2),
    ('Sunny Yellow Lily Elegance', 'Lilies in bright and sunny yellow tones, creating an elegant and joyful bouquet.', 46.99, 22, 'https://example.com/sunny-yellow-lily-elegance.jpg', 2),
    ('Crimson Red Lily Cascade', 'Red lilies arranged in a cascading display, creating a dramatic and eye-catching effect.', 59.99, 12, 'https://example.com/crimson-red-lily.jpg', 2),
    ('Azure Blue Lily Symphony', 'Lilies in azure blue hues arranged for a symphony of elegance and grace.', 49.99, 18, 'https://example.com/azure-blue-lily-symphony.jpg', 2),
    ('Golden Yellow Lily Elegance', 'Lilies in golden yellow tones arranged for an elegant and radiant floral display.', 52.99, 20, 'https://example.com/golden-yellow-lily.jpg', 2),
    ('Pastel Perfection Lily Bouquet', 'A bouquet of lilies in pastel tones, creating a soft and delicate floral arrangement.', 41.99, 28, 'https://example.com/pastel-perfection-lily.jpg', 2),
    ('Burgundy Bliss Lily Cascade', 'Burgundy lilies arranged in a cascading display, creating a blissful and rich bouquet.', 56.99, 15, 'https://example.com/burgundy-bliss-lily.jpg', 2);

	-- more data 2
	-- Additional data for category_id = 1 (Roses)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
    ('Lavender Dreams Rose Bouquet', 'Dreamy lavender roses arranged for a soothing and enchanting floral display.', 47.99, 22, 'https://example.com/lavender-dreams-rose.jpg', 1),
    ('Golden Sunset Rose Cascade', 'Roses in hues of a golden sunset, creating a warm and mesmerizing bouquet.', 54.99, 18, 'https://example.com/golden-sunset-rose.jpg', 1),
    ('Vintage Rose Garden Mix', 'A mix of roses reminiscent of a vintage rose garden, creating a nostalgic and charming arrangement.', 49.99, 20, 'https://example.com/vintage-rose-garden.jpg', 1),
    ('Sapphire Blue Rose Elegance', 'Blue roses arranged for a sophisticated and elegant floral display.', 56.99, 15, 'https://example.com/sapphire-blue-rose.jpg', 1),
    ('Harvest Gold Rose Bouquet', 'Roses in hues of harvest gold, symbolizing abundance and warmth.', 42.99, 25, 'https://example.com/harvest-gold-rose.jpg', 1),
    ('Champagne Celebration Rose Mix', 'A mix of roses in champagne tones, perfect for celebrating special moments.', 49.99, 20, 'https://example.com/champagne-celebration-rose.jpg', 1),
    ('Midsummer Night''s Rose Cascade', 'Roses arranged for a magical and romantic cascade, perfect for a midsummer night.', 59.99, 15, 'https://example.com/midsummer-nights-rose.jpg', 1),
    ('Coral Charm Rose Symphony', 'Roses in coral tones arranged for a symphony of charm and elegance.', 52.99, 18, 'https://example.com/coral-charm-rose.jpg', 1),
    ('Velvet Red Rose Elegance', 'Velvet red roses arranged for a luxurious and timeless floral display.', 64.99, 12, 'https://example.com/velvet-red-rose.jpg', 1),
    ('Peach Perfection Rose Bouquet', 'Peach roses arranged for a perfect and delicate floral arrangement.', 46.99, 22, 'https://example.com/peach-perfection-rose.jpg', 1);

-- Additional data for category_id = 2 (Lilies)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
    ('Amethyst Purple Lily Elegance', 'Purple lilies arranged for an amethyst-inspired floral display, creating a regal and enchanting effect.', 54.99, 15, 'https://example.com/amethyst-purple-lily.jpg', 2),
    ('Emerald Green Lily Cascade', 'Green lilies arranged in a cascading display, creating a fresh and vibrant bouquet.', 49.99, 20, 'https://example.com/emerald-green-lily.jpg', 2),
    ('Ruby Red Lily Symphony', 'Red lilies arranged for a symphony of passion and love, perfect for expressing deep emotions.', 62.99, 10, 'https://example.com/ruby-red-lily.jpg', 2),
    ('Ivory Elegance Lily Bouquet', 'Ivory lilies arranged for an elegant and classic floral display, creating a sense of purity and grace.', 46.99, 18, 'https://example.com/ivory-elegance-lily.jpg', 2),
    ('Goldenrod Yellow Lily Cascade', 'Yellow lilies arranged in a cascading display, creating a bouquet reminiscent of goldenrod fields.', 59.99, 12, 'https://example.com/goldenrod-yellow-lily.jpg', 2),
    ('Crimson Charm Lily Symphony', 'Lilies in crimson tones arranged for a symphony of charm and allure.', 52.99, 18, 'https://example.com/crimson-charm-lily.jpg', 2),
    ('Sunrise Glow Lily Elegance', 'Lilies in hues of sunrise glow, creating a warm and radiant floral display.', 46.99, 22, 'https://example.com/sunrise-glow-lily.jpg', 2),
    ('Pink Pearl Lily Cascade', 'Pink lilies arranged in a cascading display, creating a bouquet reminiscent of pink pearls.', 59.99, 15, 'https://example.com/pink-pearl-lily.jpg', 2),
    ('Tangerine Dream Lily Symphony', 'Lilies in tangerine tones arranged for a symphony of dreams and vibrancy.', 54.99, 18, 'https://example.com/tangerine-dream-lily.jpg', 2),
    ('Azure Mist Lily Elegance', 'Lilies in azure mist hues arranged for an elegant and misty floral display.', 49.99, 20, 'https://example.com/azure-mist-lily.jpg', 2);

-- Additional data for category_id = 3 (Tulips)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Cherry Blossom Pink Tulip Mix', 'A mix of tulips in cherry blossom pink tones, creating a delightful and charming floral arrangement.', 38.99, 25, 'https://example.com/cherry-blossom-pink-tulip.jpg', 3),
    ('Lemon Zest Yellow Tulip Elegance', 'Yellow tulips arranged for an elegant and zesty floral display.', 34.99, 28, 'https://example.com/lemon-zest-yellow-tulip.jpg', 3),
    ('Winter Wonderland White Tulip Symphony', 'White tulips arranged for a symphony reminiscent of a winter wonderland.', 42.99, 22, 'https://example.com/winter-wonderland-white-tulip.jpg', 3),
    ('Ocean Blue Tulip Cascade', 'Tulips in ocean blue hues arranged in a cascading display, creating a tranquil and refreshing bouquet.', 49.99, 18, 'https://example.com/ocean-blue-tulip.jpg', 3),
    ('Magenta Magic Tulip Mix', 'A magical mix of magenta tulips, creating a vibrant and enchanting floral arrangement.', 44.99, 20, 'https://example.com/magenta-magic-tulip.jpg', 3),
    ('Forest Green Tulip Elegance', 'Green tulips arranged for an elegant and natural floral display, reminiscent of a forest setting.', 52.99, 15, 'https://example.com/forest-green-tulip.jpg', 3),
    ('Sunset Blaze Orange Tulip Symphony', 'Orange tulips arranged for a symphony reminiscent of a sunset blaze, creating a warm and fiery effect.', 46.99, 18, 'https://example.com/sunset-blaze-orange-tulip.jpg', 3),
    ('Sapphire Sky Blue Tulip Cascade', 'Tulips in sapphire sky blue hues arranged in a cascading display, creating a serene and calming bouquet.', 54.99, 12, 'https://example.com/sapphire-sky-blue-tulip.jpg', 3),
    ('Mauve Mist Tulip Elegance', 'Tulips in mauve mist tones arranged for an elegant and misty floral display.', 49.99, 20, 'https://example.com/mauve-mist-tulip.jpg', 3),
    ('Golden Harvest Tulip Mix', 'A mix of tulips in golden harvest hues, creating a bouquet reminiscent of autumn.', 56.99, 15, 'https://example.com/golden-harvest-tulip.jpg', 3);

-- Additional data for category_id = 4 (Orchids)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id) VALUES
    ('Emerald Enchantment Orchid Arrangement', 'Emerald green orchids arranged for an enchanting and sophisticated floral display.', 64.99, 12, 'https://example.com/emerald-enchantment-orchid.jpg', 4),
    ('Velvet Violet Orchid Elegance', 'Velvet violet orchids arranged for an elegant and luxurious floral arrangement.', 54.99, 15, 'https://example.com/velvet-violet-orchid.jpg', 4),
    ('Moonlit Silver Orchid Symphony', 'Silver orchids arranged for a symphony reminiscent of a moonlit night, creating a cool and ethereal effect.', 59.99, 10, 'https://example.com/moonlit-silver-orchid.jpg', 4),
    ('Golden Radiance Orchid Cascade', 'Golden orchids arranged in a cascading display, creating a radiant and opulent bouquet.', 69.99, 8, 'https://example.com/golden-radiance-orchid.jpg', 4),
    ('Pearl White Orchid Elegance', 'Pearl white orchids arranged for an elegant and timeless floral display.', 49.99, 20, 'https://example.com/pearl-white-orchid.jpg', 4),
    ('Crimson Passion Orchid Symphony', 'Orchids in crimson tones arranged for a symphony of passion and allure.', 62.99, 10, 'https://example.com/crimson-passion-orchid.jpg', 4),
    ('Mystic Midnight Orchid Cascade', 'Orchids in hues of mystic midnight arranged in a cascading display, creating a mysterious and enchanting bouquet.', 56.99, 12, 'https://example.com/mystic-midnight-orchid.jpg', 4),
    ('Cerulean Blue Orchid Elegance', 'Cerulean blue orchids arranged for an elegant and serene floral display.', 49.99, 18, 'https://example.com/cerulean-blue-orchid.jpg', 4),
    ('Radiant Rose Gold Orchid Symphony', 'Rose gold orchids arranged for a symphony of radiance and elegance.', 59.99, 15, 'https://example.com/radiant-rose-gold-orchid.jpg', 4),
    ('Sapphire Splendor Orchid Cascade', 'Sapphire blue orchids arranged in a cascading display, creating a splendid and regal bouquet.', 64.99, 10, 'https://example.com/sapphire-splendor-orchid.jpg', 4);

-- Additional data for category_id = 5 (Sunflowers)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Harvest Gold Sunflower Bouquet', 'Sunflowers in hues of harvest gold, symbolizing abundance and warmth.', 37.99, 28, 'https://example.com/harvest-gold-sunflower.jpg', 5),
    ('Radiant Red Sunflower Elegance', 'Red sunflowers arranged for a radiant and bold floral display.', 42.99, 22, 'https://example.com/radiant-red-sunflower.jpg', 5),
    ('Golden Fields Sunflower Symphony', 'Sunflowers arranged for a symphony reminiscent of golden fields, creating a warm and picturesque bouquet.', 49.99, 18, 'https://example.com/golden-fields-sunflower.jpg', 5),
    ('Azure Sky Blue Sunflower Cascade', 'Sunflowers in azure sky blue hues arranged in a cascading display, creating a serene and calming effect.', 54.99, 15, 'https://example.com/azure-sky-blue-sunflower.jpg', 5),
    ('Sunny Yellow Sunflower Elegance', 'Sunflowers in bright and sunny yellow tones arranged for an elegant and joyful floral display.', 46.99, 20, 'https://example.com/sunny-yellow-sunflower.jpg', 5),
    ('Crimson Sunset Sunflower Symphony', 'Sunflowers in crimson hues arranged for a symphony reminiscent of a sunset, creating a warm and vibrant effect.', 52.99, 18, 'https://example.com/crimson-sunset-sunflower.jpg', 5),
    ('Autumn Blaze Sunflower Cascade', 'Sunflowers arranged in a cascading display, creating a bouquet reminiscent of autumn blaze.', 59.99, 12, 'https://example.com/autumn-blaze-sunflower.jpg', 5),
    ('Velvet Violet Sunflower Elegance', 'Sunflowers in velvet violet tones arranged for an elegant and luxurious floral display.', 64.99, 10, 'https://example.com/velvet-violet-sunflower.jpg', 5),
    ('Golden Harvest Sunflower Symphony', 'Sunflowers in golden harvest hues arranged for a symphony reminiscent of autumn.', 56.99, 15, 'https://example.com/golden-harvest-sunflower.jpg', 5),
    ('Sapphire Blue Sunflower Cascade', 'Sunflowers in sapphire blue hues arranged in a cascading display, creating a stunning and regal bouquet.', 69.99, 8, 'https://example.com/sapphire-blue-sunflower.jpg', 5);

-- Additional data for category_id = 1 (Roses)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Amber Glow Rose Bouquet', 'Roses in hues of amber, creating a warm and radiant bouquet.', 48.99, 20, 'https://example.com/amber-glow-rose.jpg', 1),
    ('Cherry Blossom Rose Cascade', 'Roses arranged in a cascading display, creating a bouquet reminiscent of cherry blossoms.', 55.99, 15, 'https://example.com/cherry-blossom-rose.jpg', 1),
    ('Midnight Mystery Rose Elegance', 'Roses in mysterious midnight hues arranged for an elegant floral display.', 42.99, 25, 'https://example.com/midnight-mystery-rose.jpg', 1),
    ('Opulent Gold Rose Symphony', 'Gold roses arranged for a symphony of opulence and luxury.', 64.99, 12, 'https://example.com/opulent-gold-rose.jpg', 1),
    ('Radiant Ruby Red Rose Cascade', 'Ruby red roses arranged in a cascading display, creating a radiant and passionate bouquet.', 49.99, 18, 'https://example.com/radiant-ruby-red-rose.jpg', 1),
    ('Serenity Blue Rose Elegance', 'Blue roses arranged for an elegant and serene floral display.', 52.99, 15, 'https://example.com/serenity-blue-rose.jpg', 1),
    ('Sunset Embrace Rose Symphony', 'Roses in hues of sunset arranged for a symphony of warmth and beauty.', 58.99, 10, 'https://example.com/sunset-embrace-rose.jpg', 1),
    ('Velvet Crimson Rose Cascade', 'Velvet crimson roses arranged in a cascading display, creating a luxurious and timeless bouquet.', 69.99, 8, 'https://example.com/velvet-crimson-rose.jpg', 1),
    ('Whispering White Rose Elegance', 'White roses arranged for an elegant and whispering floral display.', 46.99, 22, 'https://example.com/whispering-white-rose.jpg', 1),
    ('Golden Jubilee Rose Bouquet', 'Roses in golden jubilee hues arranged for a celebratory and jubilant bouquet.', 51.99, 18, 'https://example.com/golden-jubilee-rose.jpg', 1);

-- Additional data for category_id = 2 (Lilies)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Vibrant Violet Lily Elegance', 'Violet lilies arranged for a vibrant and elegant floral display.', 44.99, 20, 'https://example.com/vibrant-violet-lily.jpg', 2),
    ('Pristine Pearl White Lily Symphony', 'White lilies arranged for a symphony of pristine and timeless beauty.', 54.99, 15, 'https://example.com/pristine-pearl-white-lily.jpg', 2),
    ('Crimson Velvet Lily Cascade', 'Velvet crimson lilies arranged in a cascading display, creating a luxurious and passionate bouquet.', 49.99, 18, 'https://example.com/crimson-velvet-lily.jpg', 2),
    ('Golden Harvest Lily Elegance', 'Lilies in golden harvest hues arranged for an elegant and celebratory floral display.', 56.99, 12, 'https://example.com/golden-harvest-lily.jpg', 2),
    ('Ocean Breeze Blue Lily Symphony', 'Blue lilies arranged for a symphony reminiscent of ocean breezes.', 52.99, 18, 'https://example.com/ocean-breeze-blue-lily.jpg', 2),
    ('Sun-Kissed Yellow Lily Cascade', 'Yellow lilies arranged in a cascading display, creating a bouquet reminiscent of sun-kissed fields.', 59.99, 15, 'https://example.com/sun-kissed-yellow-lily.jpg', 2),
    ('Cerulean Mist Lily Elegance', 'Lilies in cerulean mist hues arranged for an elegant and misty floral display.', 46.99, 22, 'https://example.com/cerulean-mist-lily.jpg', 2),
    ('Scarlet Splendor Lily Symphony', 'Lilies in scarlet hues arranged for a symphony of splendor and allure.', 51.99, 18, 'https://example.com/scarlet-splendor-lily.jpg', 2),
    ('Twilight Majesty Lily Cascade', 'Lilies in hues of twilight arranged in a cascading display, creating a majestic and enchanting bouquet.', 58.99, 10, 'https://example.com/twilight-majesty-lily.jpg', 2),
    ('Radiant Ruby Red Lily Elegance', 'Ruby red lilies arranged for an elegant and radiant floral display.', 64.99, 8, 'https://example.com/radiant-ruby-red-lily.jpg', 2);

-- Additional data for category_id = 3 (Tulips)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Candy Cane Striped Tulip Mix', 'A mix of tulips in candy cane striped hues, creating a festive and delightful floral arrangement.', 38.99, 25, 'https://example.com/candy-cane-striped-tulip.jpg', 3),
    ('Royal Purple Tulip Elegance', 'Purple tulips arranged for an elegant and royal floral display.', 44.99, 20, 'https://example.com/royal-purple-tulip.jpg', 3),
    ('Golden Sunrise Tulip Symphony', 'Tulips in hues of golden sunrise arranged for a symphony reminiscent of a new day.', 49.99, 18, 'https://example.com/golden-sunrise-tulip.jpg', 3),
    ('Champagne Bubbles Tulip Cascade', 'Tulips arranged in a cascading display, creating a bouquet reminiscent of champagne bubbles.', 56.99, 15, 'https://example.com/champagne-bubbles-tulip.jpg', 3),
    ('Mauve Mist Tulip Elegance', 'Tulips in mauve mist tones arranged for an elegant and misty floral display.', 52.99, 18, 'https://example.com/mauve-mist-tulip.jpg', 3),
    ('Emerald Enchantment Tulip Symphony', 'Tulips in emerald green hues arranged for a symphony of enchantment and sophistication.', 58.99, 15, 'https://example.com/emerald-enchantment-tulip.jpg', 3),
    ('Crimson Passion Tulip Cascade', 'Tulips in crimson tones arranged in a cascading display, creating a passionate and vibrant bouquet.', 64.99, 12, 'https://example.com/crimson-passion-tulip.jpg', 3),
    ('Pink Petal Perfection Tulip Elegance', 'Pink tulips arranged for an elegant and perfect floral display.', 46.99, 22, 'https://example.com/pink-petal-perfection-tulip.jpg', 3),
    ('Sapphire Sky Blue Tulip Symphony', 'Tulips in sapphire sky blue hues arranged for a symphony reminiscent of a clear blue sky.', 51.99, 18, 'https://example.com/sapphire-sky-blue-tulip.jpg', 3),
    ('Golden Harvest Tulip Cascade', 'Tulips arranged in a cascading display, creating a bouquet reminiscent of golden harvest.', 59.99, 12, 'https://example.com/golden-harvest-tulip.jpg', 3);

-- Additional data for category_id = 4 (Orchids)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Sapphire Blue Orchid Elegance', 'Orchids in sapphire blue hues arranged for an elegant and regal floral display.', 49.99, 20, 'https://example.com/sapphire-blue-orchid.jpg', 4),
    ('Opulent Gold Orchid Symphony', 'Gold orchids arranged for a symphony of opulence and luxury.', 59.99, 15, 'https://example.com/opulent-gold-orchid.jpg', 4),
    ('Twilight Majesty Orchid Cascade', 'Orchids in hues of twilight arranged in a cascading display, creating a majestic and enchanting bouquet.', 52.99, 18, 'https://example.com/twilight-majesty-orchid.jpg', 4),
    ('Radiant Rose Gold Orchid Elegance', 'Rose gold orchids arranged for an elegant and radiant floral display.', 64.99, 12, 'https://example.com/radiant-rose-gold-orchid.jpg', 4),
    ('Mystic Midnight Orchid Symphony', 'Orchids in hues of mystic midnight arranged for a symphony of mystery and allure.', 56.99, 18, 'https://example.com/mystic-midnight-orchid.jpg', 4),
    ('Pearl White Orchid Cascade', 'Pearl white orchids arranged in a cascading display, creating a bouquet reminiscent of pure elegance.', 62.99, 10, 'https://example.com/pearl-white-orchid.jpg', 4),
    ('Crimson Passion Orchid Elegance', 'Orchids in crimson tones arranged for an elegant and passionate floral display.', 49.99, 20, 'https://example.com/crimson-passion-orchid.jpg', 4),
    ('Silver Lining Orchid Symphony', 'Silver orchids arranged for a symphony reminiscent of a silver lining.', 54.99, 15, 'https://example.com/silver-lining-orchid.jpg', 4),
    ('Velvet Violet Orchid Cascade', 'Velvet violet orchids arranged in a cascading display, creating a luxurious and mesmerizing bouquet.', 59.99, 12, 'https://example.com/velvet-violet-orchid.jpg', 4),
    ('Emerald Enchantment Orchid Elegance', 'Emerald green orchids arranged for an elegant and enchanting floral display.', 64.99, 10, 'https://example.com/emerald-enchantment-orchid.jpg', 4);

-- Additional data for category_id = 5 (Sunflowers)
INSERT INTO Product (name, description, price, stock_quantity, image, category_id)
VALUES
    ('Crimson Sunset Sunflower Cascade', 'Sunflowers in crimson hues arranged in a cascading display, creating a warm and vibrant bouquet.', 52.99, 18, 'https://example.com/crimson-sunset-sunflower.jpg', 5),
    ('Golden Fields Sunflower Symphony', 'Sunflowers arranged for a symphony reminiscent of golden fields, creating a warm and picturesque bouquet.', 49.99, 20, 'https://example.com/golden-fields-sunflower.jpg', 5),
    ('Autumn Blaze Sunflower Cascade', 'Sunflowers arranged in a cascading display, creating a bouquet reminiscent of autumn blaze.', 59.99, 12, 'https://example.com/autumn-blaze-sunflower.jpg', 5),
    ('Radiant Red Sunflower Elegance', 'Red sunflowers arranged for a radiant and bold floral display.', 42.99, 22, 'https://example.com/radiant-red-sunflower.jpg', 5),
    ('Velvet Violet Sunflower Symphony', 'Sunflowers in velvet violet tones arranged for a symphony of luxury and elegance.', 64.99, 10, 'https://example.com/velvet-violet-sunflower.jpg', 5),
    ('Sunny Yellow Sunflower Cascade', 'Sunflowers in bright and sunny yellow tones arranged in a cascading display, creating a joyful and vibrant effect.', 46.99, 22, 'https://example.com/sunny-yellow-sunflower.jpg', 5),
    ('Harvest Gold Sunflower Elegance', 'Sunflowers in hues of harvest gold, symbolizing abundance and warmth.', 37.99, 28, 'https://example.com/harvest-gold-sunflower.jpg', 5),
    ('Azure Sky Blue Sunflower Symphony', 'Sunflowers in azure sky blue hues arranged for a symphony reminiscent of a clear blue sky.', 54.99, 15, 'https://example.com/azure-sky-blue-sunflower.jpg', 5),
    ('Sapphire Blue Sunflower Cascade', 'Sunflowers in sapphire blue hues arranged in a cascading display, creating a stunning and regal bouquet.', 69.99, 8, 'https://example.com/sapphire-blue-sunflower.jpg', 5),
    ('Golden Harvest Sunflower Elegance', 'Sunflowers in golden harvest hues arranged for an elegant and celebratory floral display.', 56.99, 15, 'https://example.com/golden-harvest-sunflower.jpg', 5);


select * from Product where  category_id = 3


select * from Category