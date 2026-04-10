import { Controller, Get, Post, Body, Param, Patch, Delete, Query, UseInterceptors, UploadedFile } from '@nestjs/common';
import { UsersService } from './users.service';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) { }

  @Post('SIGNUP')
  @UseInterceptors(FileInterceptor('file')) // 'file' matches the key in Flutter's MultipartRequest
  async signup(@Body() userData: any, @UploadedFile() file: Express.Multer.File) {
    return await this.usersService.createUser(userData, file);
  }

  // 2. UPDATE (by ID)
  @Patch('UPDATE-USER/:id')
  async updateUsers(@Param('id') id: string, @Body() userData: any) {
    return await this.usersService.updateUser(id, userData);
  }

  // 3. DELETE (by ID)
  @Delete('DELETE-USER/:id')
  async deleteUsers(@Param('id') id: string) {
    return await this.usersService.deleteUser(id);
  }

  // 4. GET ALL USERS
  @Get('ALL')
  async findAllUsers() {
    return await this.usersService.getAllUsers();
  }

  // 5. GET ONE BY ID
  @Get('ID/:id')
  async findOneUsers(@Param('id') id: string) {
    return await this.usersService.getUserById(id);
  }

  // 6. FIND BY NAME
  @Get('SEARCH')
  async findByName(@Query('name') name: string) {
    return await this.usersService.getUserByName(name);
  }

}