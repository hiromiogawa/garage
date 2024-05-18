import type { MakerEntity } from '@/domain/entities/maker.entity'

export type MakerRepository = {
  findById(id: number): Promise<MakerEntity | null>
  findMany(): Promise<MakerEntity[]>
}
