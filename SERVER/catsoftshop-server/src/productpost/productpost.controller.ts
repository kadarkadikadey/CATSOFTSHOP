import { Controller, Post, Body, Patch, Delete, Param, Get, Query } from '@nestjs/common';
import { ProductpostService } from './productpost.service';

@Controller('products')
export class ProductpostController {
  constructor(private readonly productsService: ProductpostService) { }

  // 1. CREATE
  @Post('CREATE-PRODUCT')
  async createProduct(@Body() data: any) {
    return await this.productsService.createProductPost(data);
  }

  // 2. UPDATE (by ID)
  @Patch('UPDATE-PRODUCT/:id')
  async updateProduct(@Param('id') id: string, @Body() data: any) {
    return await this.productsService.updateProductPost(id, data);
  }

  // 3. DELETE (by ID)
  @Delete('DELETE-PRODUCT/:id')
  async deleteProduct(@Param('id') id: string) {
    return await this.productsService.deleteProductPost(id);
  }

  // 4. GET ALL PRODUCTS
  @Get('ALL')
  async getAll() {
    return await this.productsService.getAllPosts();
  }

  // 5. GET ONE BY ID
  @Get('ID/:id')
  async getOne(@Param('id') id: string) {
    return await this.productsService.getPostById(id);
  }

  // 6. FIND BY NAME (Search)
  @Get('SEARCH')
  async findByName(@Query('name') name: string) {
    return await this.productsService.getPostByName(name);
  }

  // NEW: Search by Author Name
  @Get('SEARCH_BY_AUTHOR')
  async findByAuthor(@Query('authorName') authorName: string) {
    return await this.productsService.getPostsByAuthor(authorName);
  }
}