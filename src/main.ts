import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { writeFileSync } from 'fs';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Swagger 配置
  const config = new DocumentBuilder()
    .setTitle('API Documentation')
    .setDescription('The API description')
    .setVersion('1.0')
    .build();

  // 创建 Swagger 文档
  const document = SwaggerModule.createDocument(app, config);

  // 将 Swagger JSON 文档写入文件
  writeFileSync('./swagger.json', JSON.stringify(document, null, 2));

  // 在 '/api' 路径下设置 Swagger UI
  SwaggerModule.setup('api', app, document);

  await app.listen(process.env.PORT || 3000);
}
bootstrap();
