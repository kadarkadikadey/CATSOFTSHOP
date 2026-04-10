import { Test, TestingModule } from '@nestjs/testing';
import { ProductpostService } from './productpost.service';

describe('ProductpostService', () => {
  let service: ProductpostService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProductpostService],
    }).compile();

    service = module.get<ProductpostService>(ProductpostService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
