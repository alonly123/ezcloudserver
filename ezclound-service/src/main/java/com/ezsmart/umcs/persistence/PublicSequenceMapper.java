package com.ezsmart.umcs.persistence;

import org.apache.ibatis.annotations.Select;

/**
 * Created by luochunteng
 */
public interface PublicSequenceMapper {
    final String SELECT_PUBLIC_SEQUENCE = "SELECT publicseq.nextval FROM dual";

    @Select(SELECT_PUBLIC_SEQUENCE)
    Integer getSeq();
}
