import { Module } from '@nestjs/common'
import { ConfigModule } from '@nestjs/config'
import { AppController } from './app.controller'
import { AppService } from './app.service'

/**
 *
 */
@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      // 左から順に環境変数が呼ばれる
      envFilePath: ['.env.development', '.env'],
      load: [],
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

const hoge = (a): string => {
  return a
}

hoge('a')
