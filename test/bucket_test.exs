defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "delete value by key and returns it", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 42)
    assert KV.Bucket.get(bucket, "milk") == 42

    assert KV.Bucket.delete(bucket, "milk") == 42
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end