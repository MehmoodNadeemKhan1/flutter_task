import 'package:drift/drift.dart';
import 'package:flutter_task/data/models/product_listing_model.dart';

import '../utils/product_listing_app_database.dart';
import 'implementation_interface.dart';

class ProductDatabaseRepository implements IRepository<Product>
{
    final AppDatabase db;
    ProductDatabaseRepository(this.db);
    @override
    Future<Product> create(Product item) async
    {
         await  db.insertProduct(
            ProductListingTableCompanion.insert(
                images: item.images ,
                category: item.category ,
                name: item.name,
                price: item.price ?? 0,
                isNegotiable: Value(item.isNegotiable) ,
                description: item.description,
                condition: item.condition,
                location: item.location,
                material: item.material,
                color: item.color,
                addNote:Value(item.addNote),
                createdAt: item.createdAt ?? ''

            )
        );
       return item;
    }

    @override
    Future<List<Product>> list() async
    {
        final users = await db.getAllProducts();
        return users.map((u)
            {
                return Product(
                    images: u.images,
                    category: u.category,
                    name: u.name,
                    description: u.description,
                    price: u.price,
                    isNegotiable: u.isNegotiable,
                    condition: u.condition,
                    location: u.location,
                    material: u.material,
                    color: u.color,
                    addNote: u.addNote
                );
            }
        ).toList();
    }

    @override
    Future<Product> update(String id, Product updatedItem) async
    {

        await db.updateProduct(
            Product(
                images: updatedItem.images,
                category: updatedItem.category,
                name: updatedItem.name,
                description: updatedItem.description,
                price: updatedItem.price,
                isNegotiable: updatedItem.isNegotiable,
                condition: updatedItem.condition,
                location: updatedItem.location,
                material: updatedItem.material,
                color: updatedItem.color,
                addNote: updatedItem.addNote

            )
        );
        return updatedItem;
    }

    @override
    Future<bool> delete(String id) async {
        final deleteCount = await db.deleteProduct(id);

        if (deleteCount > 0) {
            return true;
        } else {
            return false;
        }
    }


}
