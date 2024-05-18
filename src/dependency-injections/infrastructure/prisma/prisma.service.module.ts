import { Module } from '@nestjs/common'
import { PrismaService } from '@/infrastructure/prisma/prisma.service'

/**
 * PrismaServiceの依存関係の管理
 */
@Module({
  providers: [PrismaService],
  exports: [PrismaService],
})
export class PrismaServiceModule {}
