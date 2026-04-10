// src/products/products.module.ts
import { Module } from '@nestjs/common';
import { ProductpostService } from './productpost.service';
import { ProductpostController } from './productpost.controller';

@Module({
  controllers: [ProductpostController],
  providers: [ProductpostService],
})
export class ProductpostModule {}