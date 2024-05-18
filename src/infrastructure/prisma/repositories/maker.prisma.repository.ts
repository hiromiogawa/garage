import { Injectable } from '@nestjs/common'
import type { MakerRepository } from '@/application/repositories/maker.repository'
import type { MAKER_NAME as PRISMA_MAKER_NAME } from '@prisma/client'
import { MakerEntity } from '@/domain/entities/maker.entity'
import { PrismaService } from '@/infrastructure/prisma/prisma.service'
import { MAKER_NAME } from '@/util/statics/prisma-enum-variables'

/**
 *
 */
@Injectable()
export class MakerPrismaRepository implements MakerRepository {
  /**
   *
   * @param prisma -prismaの機能を提供するサービス
   */
  constructor(private readonly prisma: PrismaService) {}

  private toDomainMakerName(
    prismaMakerName: PRISMA_MAKER_NAME,
  ): keyof typeof MAKER_NAME {
    if (Object.values(MAKER_NAME).includes(prismaMakerName)) {
      return prismaMakerName as keyof typeof MAKER_NAME
    }
    throw new Error(`Invalid MakerName: ${prismaMakerName}`)
  }

  private toDomain(maker: {
    id: bigint
    name: PRISMA_MAKER_NAME
    isEnabled: boolean
    createdAt: Date
    updatedAt: Date
  }): MakerEntity {
    return new MakerEntity(
      maker.id,
      this.toDomainMakerName(maker.name),
      maker.isEnabled,
      maker.createdAt,
      maker.updatedAt,
    )
  }

  /**
   * @param id -データid
   * @returns idに該当するデータ
   */
  async findById(id: number): Promise<MakerEntity | null> {
    const maker = await this.prisma.maker.findUnique({ where: { id } })
    if (!maker) return null
    return this.toDomain(maker)
  }

  /**
   * @returns 論理削除されていない全てのメーカー
   */
  async findMany(): Promise<MakerEntity[]> {
    const makers = await this.prisma.maker.findMany({
      where: {
        isEnabled: true,
      },
    })
    if (!makers) return []

    return makers.map((maker) => this.toDomain(maker))
  }
}
