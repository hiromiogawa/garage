import { Module } from '@nestjs/common'
import { PrismaService } from '@/infrastructure/prisma/prisma.service'
import { MakerPrismaRepository } from '@/infrastructure/prisma/repositories/maker.prisma.repository'

/**
 * MakerRepositoryの依存関係の管理
 */
@Module({
  providers: [
    PrismaService,
    { provide: 'MakerRepository', useClass: MakerPrismaRepository },
  ],
  exports: ['MakerRepository'],
})
export class MakerRepositoryModule {}
