import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersService } from './users/users.service';
import { FirebaseModule } from 'firebase.module';
import { UsersModule } from './users/users.module';
import { ProductpostService } from './productpost/productpost.service';
import { ProductpostModule } from './productpost/productPost.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [FirebaseModule, UsersModule, ProductpostModule, ConfigModule.forRoot()],
  controllers: [AppController],
  providers: [AppService, UsersService, ProductpostService],
})
export class AppModule { }
