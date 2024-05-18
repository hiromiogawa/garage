import { Injectable } from '@nestjs/common'
import { PrismaClient } from '@prisma/client'
import type { OnModuleInit } from '@nestjs/common'

/**
 * Prismaの機能提供用のService
 */
@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  onModuleInit = async (): Promise<void> => {
    await this.$connect()
  }
}
