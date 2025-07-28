import { notFound } from "next/navigation";
import { db } from "@/lib/prisma";

import ProductDetails from "./components/product-details";
import ProductHeader from "./components/product-header";

interface ProductPageProps {
  params: { slug: string; productid: string };
}

export default async function ProductPage({ params }: ProductPageProps) {
  const { slug, productid: productId } = params;

  const product = await db.product.findUnique({
    where: { id: productId },
    include: {
      restaurant: {
        select: {
          name: true,
          avatarImageUrl: true,
          slug: true,
        },
      },
    },
  });

  if (
    !product ||
    product.restaurant.slug.toUpperCase() !== slug.toUpperCase()
  ) {
    return notFound();
  }

  return (
    <div className="flex h-full flex-col">
      <ProductHeader product={product} />
      <ProductDetails product={product} />
    </div>
  );
}
