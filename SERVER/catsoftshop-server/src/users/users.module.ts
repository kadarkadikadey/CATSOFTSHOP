
// src/users/users.module.ts
import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller'; // <--- Add this

@Module({
  controllers: [UsersController], // <--- And this
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}